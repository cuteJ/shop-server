# -*- encoding: utf-8 -*-
# stub: asciidoctor-pdf-cjk 0.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = "asciidoctor-pdf-cjk".freeze
  s.version = "0.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Rei".freeze]
  s.bindir = "exe".freeze
  s.date = "2016-12-07"
  s.description = "asciidoctor-pdf CJK extension".freeze
  s.email = ["chloerei@gmail.com".freeze]
  s.homepage = "".freeze
  s.rubygems_version = "2.6.8".freeze
  s.summary = "asciidoctor-pdf CJK extension".freeze

  s.installed_by_version = "2.6.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<asciidoctor-pdf>.freeze, ["~> 1.5.0.alpha.8"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.10"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
    else
      s.add_dependency(%q<asciidoctor-pdf>.freeze, ["~> 1.5.0.alpha.8"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.10"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<minitest>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<asciidoctor-pdf>.freeze, ["~> 1.5.0.alpha.8"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.10"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<minitest>.freeze, [">= 0"])
  end
end
