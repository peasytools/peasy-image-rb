# frozen_string_literal: true

require_relative "lib/peasy_image/version"

Gem::Specification.new do |s|
  s.name        = "peasy-image"
  s.version     = PeasyImage::VERSION
  s.summary     = "Image processing — resize, crop, compress, convert, watermark"
  s.description = "Image processing library for Ruby — resize, crop, compress, convert between formats, and add watermarks. Uses ImageMagick/GraphicsMagick via system CLI."
  s.authors     = ["PeasyTools"]
  s.email       = ["hello@peasytools.com"]
  s.homepage    = "https://peasyimage.com"
  s.license     = "MIT"
  s.required_ruby_version = ">= 3.0"

  s.files = Dir["lib/**/*.rb"]

  s.metadata = {
    "homepage_uri"      => "https://peasyimage.com",
    "source_code_uri"   => "https://github.com/peasytools/peasy-image-rb",
    "changelog_uri"     => "https://github.com/peasytools/peasy-image-rb/blob/main/CHANGELOG.md",
    "documentation_uri" => "https://peasyimage.com",
    "bug_tracker_uri"   => "https://github.com/peasytools/peasy-image-rb/issues",
  }
end
