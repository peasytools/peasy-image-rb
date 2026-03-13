# peasy-image

[![Gem Version](https://badge.fury.io/rb/peasy-image.svg)](https://rubygems.org/gems/peasy-image)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

Image processing library for Ruby — resize, crop, compress, convert between formats, and add watermarks. Uses ImageMagick/GraphicsMagick via system CLI.

Built from [Peasyimage](https://peasyimage.com), a free online toolkit.

## Install

```bash
gem install peasy-image
```

## Quick Start

```ruby
require "peasy_image"

# Check version
puts PeasyImage::VERSION  # => "0.1.1"
```

## Also Available

| Platform | Package | Install |
|----------|---------|---------|
| **PyPI** | [peasy-image](https://pypi.org/project/peasy-image/) | `pip install peasy-image` |
| **npm** | [peasy-image](https://www.npmjs.com/package/peasy-image) | `npm install peasy-image` |
| **crates.io** | [peasy-image](https://crates.io/crates/peasy-image) | `cargo add peasy-image` |
| **Homebrew** | [peasytools/peasy](https://github.com/peasytools/homebrew-peasy) | `brew install peasytools/peasy/peasy-image` |

## Peasy Developer Tools

| Package | PyPI | npm | RubyGems | crates.io | Description |
|---------|------|-----|----------|-----------|-------------|
| **peasy-image** | [PyPI](https://pypi.org/project/peasy-image/) | [npm](https://www.npmjs.com/package/peasy-image) | **[Gem](https://rubygems.org/gems/peasy-image)** | [Crate](https://crates.io/crates/peasy-image) | **Image processing — resize, crop, compress, convert, watermark** |
| peasy-pdf | [PyPI](https://pypi.org/project/peasy-pdf/) | [npm](https://www.npmjs.com/package/peasy-pdf) | [Gem](https://rubygems.org/gems/peasy-pdf) | [Crate](https://crates.io/crates/peasy-pdf) | PDF merge, split, compress, rotate, watermark |
| peasy-image | [PyPI](https://pypi.org/project/peasy-image/) | [npm](https://www.npmjs.com/package/peasy-image) | [Gem](https://rubygems.org/gems/peasy-image) | [Crate](https://crates.io/crates/peasy-image) | Image resize, crop, compress, convert, watermark |
| peasytext | [PyPI](https://pypi.org/project/peasytext/) | [npm](https://www.npmjs.com/package/peasytext) | [Gem](https://rubygems.org/gems/peasytext) | [Crate](https://crates.io/crates/peasytext) | Text analysis, case conversion, slugs, word count |
| peasy-css | [PyPI](https://pypi.org/project/peasy-css/) | [npm](https://www.npmjs.com/package/peasy-css) | [Gem](https://rubygems.org/gems/peasy-css) | [Crate](https://crates.io/crates/peasy-css) | CSS gradients, shadows, flexbox, grid generators |
| peasy-compress | [PyPI](https://pypi.org/project/peasy-compress/) | [npm](https://www.npmjs.com/package/peasy-compress) | [Gem](https://rubygems.org/gems/peasy-compress) | [Crate](https://crates.io/crates/peasy-compress) | Gzip, deflate, brotli compression |
| peasy-document | [PyPI](https://pypi.org/project/peasy-document/) | [npm](https://www.npmjs.com/package/peasy-document) | [Gem](https://rubygems.org/gems/peasy-document) | [Crate](https://crates.io/crates/peasy-document) | Markdown, HTML, CSV, JSON, YAML conversion |
| peasy-audio | [PyPI](https://pypi.org/project/peasy-audio/) | [npm](https://www.npmjs.com/package/peasy-audio) | [Gem](https://rubygems.org/gems/peasy-audio) | [Crate](https://crates.io/crates/peasy-audio) | Audio convert, trim, merge, normalize, effects |
| peasy-video | [PyPI](https://pypi.org/project/peasy-video/) | [npm](https://www.npmjs.com/package/peasy-video) | [Gem](https://rubygems.org/gems/peasy-video) | [Crate](https://crates.io/crates/peasy-video) | Video trim, resize, thumbnails, GIF conversion |

Part of the [Peasy](https://peasytools.com) developer tools ecosystem.

## License

MIT
