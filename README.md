# peasy-image

[![Gem Version](https://badge.fury.io/rb/peasy-image.svg)](https://rubygems.org/gems/peasy-image)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Ruby client for the [PeasyImage](https://peasyimage.com) API — resize, crop, compress, convert, and watermark images. Zero dependencies beyond Ruby stdlib (Net::HTTP, JSON, URI).

Built from [PeasyImage](https://peasyimage.com), a free online image toolkit with tools for every image workflow — resize to exact dimensions, crop regions, compress file size, convert between formats, and add watermarks.

> **Try the interactive tools at [peasyimage.com](https://peasyimage.com)** — [Image Tools](https://peasyimage.com/), [Image Glossary](https://peasyimage.com/glossary/), [Image Guides](https://peasyimage.com/guides/)

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

## Learn More

- **Tools**: [Image Compress](https://peasyimage.com/image/compress-image/) · [Image Resize](https://peasyimage.com/image/resize-image/) · [Image Convert](https://peasyimage.com/image/convert-image/) · [All Tools](https://peasyimage.com/)
- **Guides**: [Image Format Comparison](https://peasyimage.com/guides/image-format-comparison/) · [How to Compress Images for Web](https://peasyimage.com/guides/how-to-compress-images-for-web/) · [All Guides](https://peasyimage.com/guides/)
- **Glossary**: [AVIF](https://peasyimage.com/glossary/avif/) · [Color Grading](https://peasyimage.com/glossary/color-grading-image/) · [Alpha Channel](https://peasyimage.com/glossary/alpha-channel/) · [All Terms](https://peasyimage.com/glossary/)
- **Formats**: [PNG](https://peasyimage.com/formats/png/) · [WebP](https://peasyimage.com/formats/webp/) · [All Formats](https://peasyimage.com/formats/)
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
