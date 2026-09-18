# frozen_string_literal: true

require "open3"
require "safe_yaml"
require "time"

module Jekyll
  class PageLastModified < Generator
    priority :low

    def generate(site)
      @source = site.source
      @content = {}

      (site.pages + site.collections.values.flat_map(&:docs)).each do |page|
        next unless %w[default post].include?(page.data["layout"])

        source_path = page.path.sub(/\A#{Regexp.escape(@source)}\/?/, "")
        paths = [source_path] + Array(page.data["last_modified_paths"])
        modified = modified_at(paths).getlocal
        page.data["footer_modified_iso"] = modified.iso8601
        page.data["footer_modified_text"] = modified.strftime("%a %b %d %H:%M:%S %Z %Y")
      end
    end

    private

    def git(*args)
      output, status = Open3.capture2("git", "-C", @source, *args, :err => File::NULL)
      status.success? ? output : ""
    rescue Errno::ENOENT
      ""
    end

    def modified_at(paths)
      history = git("log", "--format=%H %ct %P", "--", *paths)
      history.each_line do |entry|
        commit, timestamp, parent = entry.split
        files = if parent
                  git("diff", "--name-only", "-z", parent, commit, "--", *paths)
                else
                  git("ls-tree", "-r", "--name-only", "-z", commit, "--", *paths)
                end

        changed = files.split("\0").any? do |file|
          committed_content(commit, file) != committed_content(parent, file)
        end
        return Time.at(timestamp.to_i) if changed
      end

      # Only pages without Git history fall back to their source-file times.
      unless history.empty?
        return Time.at(history.lines.last.split[1].to_i)
      end

      files = paths.flat_map { |path| Dir.glob(File.join(@source, path, "**", "*")) + [File.join(@source, path)] }
      files.select { |file| File.file?(file) }.map { |file| File.mtime(file) }.max
    end

    def committed_content(commit, file)
      return nil unless commit

      key = [commit, file]
      return @content[key] if @content.key?(key)

      content = git("show", "#{commit}:#{file}")
      front_matter = content.match(/\A---[ \t]*\r?\n(.*?)\r?\n---[ \t]*(?:\r?\n|\z)(.*)\z/m)
      @content[key] = if front_matter
                        metadata = SafeYAML.load(front_matter[1]) || {}
                        # Configuring timestamp dependencies does not edit the page.
                        metadata.delete("last_modified_paths")
                        [metadata, front_matter[2]]
                      else
                        content
                      end
    end
  end
end
