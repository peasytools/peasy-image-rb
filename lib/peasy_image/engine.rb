# frozen_string_literal: true

require "open3"
require "json"

module PeasyImage
  module_function

  def info(path)
    out, err, st = Open3.capture3("identify", "-format", "%w %h %m %b", path.to_s)
    raise Error, "identify failed: #{err}" unless st.success?
    parts = out.strip.split
    { width: parts[0].to_i, height: parts[1].to_i, format: parts[2], size: parts[3] }
  end

  def resize(input, width:, height: nil, output: nil)
    output ||= input.to_s.sub(/(\.\w+)$/, "_resized\\1")
    geom = height ? "#{width}x#{height}" : "#{width}x"
    _o, err, st = Open3.capture3("convert", input.to_s, "-resize", geom, output)
    raise Error, "resize failed: #{err}" unless st.success?
    output
  end

  def crop(input, width:, height:, x: 0, y: 0, output: nil)
    output ||= input.to_s.sub(/(\.\w+)$/, "_cropped\\1")
    geom = "#{width}x#{height}+#{x}+#{y}"
    _o, err, st = Open3.capture3("convert", input.to_s, "-crop", geom, "+repage", output)
    raise Error, "crop failed: #{err}" unless st.success?
    output
  end

  def convert(input, format:, output: nil)
    output ||= input.to_s.sub(/\.\w+$/, ".#{format}")
    _o, err, st = Open3.capture3("convert", input.to_s, output)
    raise Error, "convert failed: #{err}" unless st.success?
    output
  end

  def compress(input, quality: 80, output: nil)
    output ||= input.to_s.sub(/(\.\w+)$/, "_compressed\\1")
    _o, err, st = Open3.capture3("convert", input.to_s, "-quality", quality.to_s, output)
    raise Error, "compress failed: #{err}" unless st.success?
    output
  end

  def rotate(input, degrees: 90, output: nil)
    output ||= input.to_s.sub(/(\.\w+)$/, "_rotated\\1")
    _o, err, st = Open3.capture3("convert", input.to_s, "-rotate", degrees.to_s, output)
    raise Error, "rotate failed: #{err}" unless st.success?
    output
  end

  class Error < StandardError; end
end
