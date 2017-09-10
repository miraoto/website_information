# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "website_information/version"
require 'open-uri'

Gem::Specification.new do |spec|
  spec.name          = "website_information"
  spec.version       = WebsiteInformation::VERSION
  spec.authors       = ["miraoto"]
  spec.email         = ["miraoto@gmail.com"]

  spec.summary       = %q{scrape website information that title, meta, page capture, description, ogp and so on.}
  spec.homepage      = "https://github.com/miraoto/website_information"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri"
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry-byebug"
end
