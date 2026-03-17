# peasy-image

[![Gem Version](https://badge.fury.io/rb/peasy-image.svg)](https://rubygems.org/gems/peasy-image)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![GitHub stars](https://agentgif.com/badge/github/peasytools/peasy-image-rb/stars.svg)](https://github.com/peasytools/peasy-image-rb)

Ruby client for the [PeasyImage](https://peasyimage.com) API — compress, resize, convert, and crop images. Zero dependencies beyond Ruby stdlib (Net::HTTP, JSON, URI).

Built from [PeasyImage](https://peasyimage.com), a comprehensive image processing toolkit offering free online tools for compressing, resizing, converting, and cropping images across all major formats. The site includes in-depth guides on image optimization for the web, format comparisons between WebP, AVIF, PNG, and JPEG, plus a glossary covering concepts from color spaces to alpha channels to EXIF metadata.

> **Try the interactive tools at [peasyimage.com](https://peasyimage.com)** — [Compress Image](https://peasyimage.com/image/compress-image/), [Resize Image](https://peasyimage.com/image/resize-image/), [Convert Image](https://peasyimage.com/image/convert-image/), [Crop Image](https://peasyimage.com/image/crop-image/), and more.

<p align="center">
  <img src="demo.gif" alt="peasy-image demo — image compress, resize, and convert tools in Ruby terminal" width="800">
</p>

## Table of Contents

- [Install](#install)
- [Quick Start](#quick-start)
- [What You Can Do](#what-you-can-do)
  - [Image Processing Operations](#image-processing-operations)
  - [Browse Reference Content](#browse-reference-content)
  - [Search and Discovery](#search-and-discovery)
- [API Client](#api-client)
  - [Available Methods](#available-methods)
- [Learn More About Image Tools](#learn-more-about-image-tools)
- [Also Available](#also-available)
- [Peasy Developer Tools](#peasy-developer-tools)
- [License](#license)

## Install

```bash
gem install peasy-image
```

Or add to your Gemfile:

```ruby
gem "peasy-image"
```

## Quick Start

```ruby
require "peasy_image"

client = PeasyImage::Client.new

# List available image tools
tools = client.list_tools
tools["results"].each do |tool|
  puts "#{tool["name"]}: #{tool["description"]}"
end
```

## What You Can Do

### Image Processing Operations

Digital images are stored in dozens of formats, each optimized for different use cases. JPEG uses lossy compression ideal for photographs, PNG supports lossless compression with alpha channel transparency, WebP (developed by Google) offers both lossy and lossless modes at 25-34% smaller file sizes than JPEG, and AVIF (based on the AV1 video codec) pushes compression efficiency even further. PeasyImage provides tools to compress, resize, convert, and crop images across all these formats.

| Operation | Slug | Description |
|-----------|------|-------------|
| Compress Image | `compress-image` | Reduce file size while preserving visual quality |
| Resize Image | `resize-image` | Scale dimensions with aspect ratio preservation |
| Convert Image | `convert-image` | Transform between PNG, JPEG, WebP, AVIF, and more |
| Crop Image | `crop-image` | Extract rectangular regions from images |

Image compression quality is typically measured using structural similarity (SSIM) or peak signal-to-noise ratio (PSNR) metrics that quantify visual degradation. At JPEG quality 85, most photographs show no perceptible difference from the original while achieving 10-15:1 compression ratios. WebP and AVIF consistently achieve the same visual quality at 25-50% smaller file sizes by using more sophisticated prediction and transform coding techniques than JPEG's DCT-based approach.

```ruby
require "peasy_image"

client = PeasyImage::Client.new

# Retrieve the image compression tool and inspect its capabilities
tool = client.get_tool("compress-image")
puts "Tool: #{tool["name"]}"              # Image compression tool name
puts "Description: #{tool["description"]}" # How compression works

# List all available image tools with pagination
tools = client.list_tools(page: 1, limit: 20)
puts "Total image tools available: #{tools["count"]}"
```

Learn more: [Compress Image Tool](https://peasyimage.com/image/compress-image/) · [How to Compress Images for Web](https://peasyimage.com/guides/how-to-compress-images-for-web/) · [Image Format Comparison](https://peasyimage.com/guides/image-format-comparison/)

### Browse Reference Content

PeasyImage includes a detailed glossary of image processing and digital media terminology, plus educational guides on format selection and optimization workflows. The glossary covers concepts like WebP (Google's modern image format with superior compression), EXIF (Exchangeable Image File Format metadata embedded by cameras), lossy vs. lossless compression trade-offs, color spaces (sRGB, Adobe RGB, Display P3), and alpha channels for transparency support.

| Term | Description |
|------|-------------|
| [WebP](https://peasyimage.com/glossary/webp/) | Google's modern image format — lossy and lossless modes |
| [EXIF](https://peasyimage.com/glossary/exif/) | Exchangeable Image File Format — camera metadata standard |
| [Lossy Compression](https://peasyimage.com/glossary/lossy-compression/) | Compression that discards data to achieve smaller files |
| [Color Space](https://peasyimage.com/glossary/color-space/) | Mathematical model defining the range of representable colors |
| [Alpha Channel](https://peasyimage.com/glossary/alpha-channel/) | Transparency layer in PNG, WebP, and AVIF images |

Modern image format selection involves balancing compression efficiency, browser support, and feature requirements. WebP typically produces files 25-34% smaller than equivalent JPEG images while supporting both lossy and lossless modes plus transparency. AVIF (based on the AV1 video codec) pushes compression even further — often 50% smaller than JPEG at equivalent visual quality — but encoding is significantly slower and browser support, while growing rapidly, is not yet universal across all platforms and devices.

```ruby
require "peasy_image"

client = PeasyImage::Client.new

# Browse the image glossary for digital media terminology
glossary = client.list_glossary(search: "webp")
glossary["results"].each do |term|
  puts "#{term["term"]}: #{term["definition"]}"
end

# Read a guide on choosing the right image format
guide = client.get_guide("image-format-comparison")
puts "Guide: #{guide["title"]} (Level: #{guide["audience_level"]})"
```

Learn more: [Image Glossary](https://peasyimage.com/glossary/) · [Image Format Comparison](https://peasyimage.com/guides/image-format-comparison/) · [How to Compress Images for Web](https://peasyimage.com/guides/how-to-compress-images-for-web/)

### Search and Discovery

The API supports full-text search across all content types — tools, glossary terms, guides, use cases, and format documentation. Search results are grouped by content type, making it easy to find the right tool or reference for any image processing workflow. Format conversion data covers the full matrix of source-to-target transformations, including feature constraints — converting from PNG to JPEG discards the alpha channel since JPEG does not support transparency, while converting to WebP preserves transparency with significantly smaller file sizes.

```ruby
require "peasy_image"

client = PeasyImage::Client.new

# Search across all image content — tools, glossary, guides, and formats
results = client.search("convert webp")
puts "Found #{results["results"]["tools"].length} tools"
puts "Found #{results["results"]["glossary"].length} glossary terms"
puts "Found #{results["results"]["guides"].length} guides"

# Discover format conversion paths — what can PNG convert to?
conversions = client.list_conversions(source: "png")
conversions["results"].each do |c|
  puts "#{c["source_format"]} -> #{c["target_format"]}"
end

# Get detailed information about a specific image format
format = client.get_format("png")
puts "#{format["name"]} (#{format["extension"]}): #{format["mime_type"]}"
```

| Format | Compression | Transparency | Primary Use |
|--------|------------|-------------|-------------|
| JPEG | Lossy | No | Photographs, web images |
| PNG | Lossless | Yes (alpha) | Graphics, screenshots, icons |
| WebP | Both | Yes (alpha) | Modern web, smaller than JPEG/PNG |
| AVIF | Both | Yes (alpha) | Next-gen web, best compression ratio |

Learn more: [REST API Docs](https://peasyimage.com/developers/) · [All Image Tools](https://peasyimage.com/) · [All Formats](https://peasyimage.com/formats/)

## API Client

The client wraps the [PeasyImage REST API](https://peasyimage.com/developers/) using only Ruby standard library — no external dependencies.

```ruby
require "peasy_image"

client = PeasyImage::Client.new
# Or with a custom base URL:
# client = PeasyImage::Client.new(base_url: "https://custom.example.com")

# List tools with pagination and filters
tools = client.list_tools(page: 1, limit: 10, search: "resize")

# Get a specific tool by slug
tool = client.get_tool("image-resize")
puts "#{tool["name"]}: #{tool["description"]}"

# Search across all content
results = client.search("resize")
puts "Found #{results["results"]["tools"].length} tools"

# Browse the glossary
glossary = client.list_glossary(search: "jpeg")
glossary["results"].each do |term|
  puts "#{term["term"]}: #{term["definition"]}"
end

# Discover guides
guides = client.list_guides(category: "images")
guides["results"].each do |guide|
  puts "#{guide["title"]} (#{guide["audience_level"]})"
end

# List file format conversions
conversions = client.list_conversions(source: "png")

# Get format details
format = client.get_format("png")
puts "#{format["name"]} (#{format["extension"]}): #{format["mime_type"]}"
```

### Available Methods

| Method | Description |
|--------|-------------|
| `list_tools` | List tools (paginated, filterable) |
| `get_tool(slug)` | Get tool by slug |
| `list_categories` | List tool categories |
| `list_formats` | List file formats |
| `get_format(slug)` | Get format by slug |
| `list_conversions` | List format conversions |
| `list_glossary` | List glossary terms |
| `get_glossary_term(slug)` | Get glossary term |
| `list_guides` | List guides |
| `get_guide(slug)` | Get guide by slug |
| `list_use_cases` | List use cases |
| `search(query)` | Search across all content |
| `list_sites` | List Peasy sites |
| `openapi_spec` | Get OpenAPI specification |

All list methods accept keyword arguments: `page:`, `limit:`, `category:`, `search:`.

Full API documentation at [peasyimage.com/developers/](https://peasyimage.com/developers/).
OpenAPI 3.1.0 spec: [peasyimage.com/api/openapi.json](https://peasyimage.com/api/openapi.json).

## Learn More About Image Tools

- **Tools**: [Compress Image](https://peasyimage.com/image/compress-image/) · [Resize Image](https://peasyimage.com/image/resize-image/) · [Convert Image](https://peasyimage.com/image/convert-image/) · [Crop Image](https://peasyimage.com/image/crop-image/) · [All Tools](https://peasyimage.com/)
- **Guides**: [Image Format Comparison](https://peasyimage.com/guides/image-format-comparison/) · [How to Compress Images for Web](https://peasyimage.com/guides/how-to-compress-images-for-web/) · [All Guides](https://peasyimage.com/guides/)
- **Glossary**: [WebP](https://peasyimage.com/glossary/webp/) · [EXIF](https://peasyimage.com/glossary/exif/) · [Lossy Compression](https://peasyimage.com/glossary/lossy-compression/) · [Color Space](https://peasyimage.com/glossary/color-space/) · [Alpha Channel](https://peasyimage.com/glossary/alpha-channel/) · [All Terms](https://peasyimage.com/glossary/)
- **Formats**: [All Formats](https://peasyimage.com/formats/)
- **API**: [REST API Docs](https://peasyimage.com/developers/) · [OpenAPI Spec](https://peasyimage.com/api/openapi.json)

## Also Available

| Language | Package | Install |
|----------|---------|---------|
| **Python** | [peasy-image](https://pypi.org/project/peasy-image/) | `pip install "peasy-image[all]"` |
| **TypeScript** | [peasy-image](https://www.npmjs.com/package/peasy-image) | `npm install peasy-image` |
| **Go** | [peasy-image-go](https://pkg.go.dev/github.com/peasytools/peasy-image-go) | `go get github.com/peasytools/peasy-image-go` |
| **Rust** | [peasy-image](https://crates.io/crates/peasy-image) | `cargo add peasy-image` |

## Peasy Developer Tools

Part of the [Peasy Tools](https://peasytools.com) open-source developer ecosystem.

| Package | PyPI | npm | RubyGems | Description |
|---------|------|-----|----------|-------------|
| peasy-pdf | [PyPI](https://pypi.org/project/peasy-pdf/) | [npm](https://www.npmjs.com/package/peasy-pdf) | [Gem](https://rubygems.org/gems/peasy-pdf) | PDF merge, split, rotate, compress — [peasypdf.com](https://peasypdf.com) |
| **peasy-image** | [PyPI](https://pypi.org/project/peasy-image/) | [npm](https://www.npmjs.com/package/peasy-image) | [Gem](https://rubygems.org/gems/peasy-image) | **Image resize, crop, convert, compress — [peasyimage.com](https://peasyimage.com)** |
| peasy-audio | [PyPI](https://pypi.org/project/peasy-audio/) | [npm](https://www.npmjs.com/package/peasy-audio) | [Gem](https://rubygems.org/gems/peasy-audio) | Audio trim, merge, convert, normalize — [peasyaudio.com](https://peasyaudio.com) |
| peasy-video | [PyPI](https://pypi.org/project/peasy-video/) | [npm](https://www.npmjs.com/package/peasy-video) | [Gem](https://rubygems.org/gems/peasy-video) | Video trim, resize, thumbnails, GIF — [peasyvideo.com](https://peasyvideo.com) |
| peasy-css | [PyPI](https://pypi.org/project/peasy-css/) | [npm](https://www.npmjs.com/package/peasy-css) | [Gem](https://rubygems.org/gems/peasy-css) | CSS minify, format, analyze — [peasycss.com](https://peasycss.com) |
| peasy-compress | [PyPI](https://pypi.org/project/peasy-compress/) | [npm](https://www.npmjs.com/package/peasy-compress) | [Gem](https://rubygems.org/gems/peasy-compress) | ZIP, TAR, gzip compression — [peasytools.com](https://peasytools.com) |
| peasy-document | [PyPI](https://pypi.org/project/peasy-document/) | [npm](https://www.npmjs.com/package/peasy-document) | [Gem](https://rubygems.org/gems/peasy-document) | Markdown, HTML, CSV, JSON conversion — [peasyformats.com](https://peasyformats.com) |
| peasytext | [PyPI](https://pypi.org/project/peasytext/) | [npm](https://www.npmjs.com/package/peasytext) | [Gem](https://rubygems.org/gems/peasytext) | Text case conversion, slugify, word count — [peasytext.com](https://peasytext.com) |

## License

MIT
