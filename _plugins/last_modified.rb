# frozen_string_literal: true

require "open3"
require "time"

module Jekyll
  class PageLastModified < Generator
    priority :low

    def generate(site)
      @source = site.source

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
      committed = git("log", "-1", "--format=%ct", "--", *paths).strip
      return Time.at(committed.to_i) unless committed.empty?

      # Only pages without Git history fall back to their source-file times.
      files = paths.flat_map { |path| Dir.glob(File.join(@source, path, "**", "*")) + [File.join(@source, path)] }
      files.select { |file| File.file?(file) }.map { |file| File.mtime(file) }.max
    end
  end
end
