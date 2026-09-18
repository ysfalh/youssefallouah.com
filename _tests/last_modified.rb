# frozen_string_literal: true

require "jekyll"
require "tmpdir"
require "fileutils"
require_relative "../_plugins/last_modified"

Page = Struct.new(:path, :data)
Site = Struct.new(:source, :pages, :collections)

def git(source, *args, date: nil)
  env = date ? { "GIT_AUTHOR_DATE" => date, "GIT_COMMITTER_DATE" => date } : {}
  output, error, status = Open3.capture3(
    env, "git", "-C", source,
    "-c", "user.name=Timestamp test", "-c", "user.email=test@example.invalid",
    "-c", "commit.gpgsign=false", "-c", "core.hooksPath=/dev/null", *args
  )
  raise error unless status.success?

  output
end

def commit(source, date)
  git(source, "add", ".")
  git(source, "commit", "-qm", "Fixture change", date: date)
end

def check(site, expected, label)
  Jekyll::PageLastModified.new.generate(site)
  actual = site.pages.first.data.fetch("footer_modified_iso")
  raise "#{label}: expected #{expected}, got #{actual}" unless actual == expected
end

ENV["TZ"] = "America/Los_Angeles"

Dir.mktmpdir("page-timestamps-") do |source|
  git(source, "init", "-q")
  FileUtils.mkdir_p(File.join(source, "_data"))
  page_path = File.join(source, "index.md")
  data_path = File.join(source, "_data", "items.yml")
  original = "---\nlayout: default\ntitle: Example\n---\nOriginal content.\n"
  File.write(page_path, original)
  File.write(data_path, "- First item\n")
  commit(source, "2026-01-20T12:56:46-08:00")

  page = Page.new("index.md", { "layout" => "default", "last_modified_paths" => ["_data/items.yml"] })
  site = Site.new(source, [page], {})
  check(site, "2026-01-20T12:56:46-08:00", "Initial content in PST")

  configured = original.sub("title: Example\n", "title: Example\nlast_modified_paths:\n  - _data/items.yml\n")
  File.write(page_path, configured)
  commit(source, "2026-09-17T12:00:00-07:00")
  check(site, "2026-01-20T12:56:46-08:00", "Timestamp configuration must not advance the date")

  FileUtils.mkdir_p(File.join(source, "_includes"))
  File.write(File.join(source, "_includes", "footer.html"), "New footer")
  commit(source, "2026-09-17T13:00:00-07:00")
  check(site, "2026-01-20T12:56:46-08:00", "Shared footer changes must not advance the date")

  File.write(page_path, configured.sub("Original content.", "Revised content."))
  commit(source, "2026-09-18T12:00:00-07:00")
  check(site, "2026-09-18T12:00:00-07:00", "Content edit in PDT")

  File.write(data_path, "- First item\n- Second item\n")
  commit(source, "2026-09-19T12:00:00-07:00")
  check(site, "2026-09-19T12:00:00-07:00", "Linked content changes")

  File.write(page_path, File.read(page_path).sub("title: Example", "title: New title"))
  commit(source, "2026-09-20T12:00:00-07:00")
  check(site, "2026-09-20T12:00:00-07:00", "Visible front matter changes")

  File.write(page_path, "Uncommitted local edit")
  check(site, "2026-09-20T12:00:00-07:00", "Uncommitted changes must not advance the date")
end

puts "Timestamp history checks passed."
