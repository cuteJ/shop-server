# Asciidoctor PDF CJK: A CJK extension fo Asciidoctor PDF

Current do this things:

- Insert zero-width space(ZWSP) before CJ characters to fix line wrap


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'asciidoctor-pdf-cjk', '~> 0.1.3'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install asciidoctor-pdf-cjk

## Usage

Render PDF:

    $ asciidoctor-pdf -r asciidoctor-pdf-cjk doc.asc

## Themes

- [Asciidoctor::Pdf::CJK::KaiGenGothic](https://github.com/chloerei/asciidoctor-pdf-cjk-kai_gen_gothic)

  A theme using font [KaiGen Gothic](https://github.com/akiratw/kaigen-gothic).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chloerei/asciidoctor-pdf-cjk.
