# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fleck/version'

Gem::Specification.new do |spec|
  spec.name          = "fleck"
  spec.version       = Fleck::VERSION
  spec.authors       = ["Tom Scott"]
  spec.email         = ["tubbo@psychedeli.ca"]
  spec.summary       = %q{An inflection-based command line search tool.}
  spec.description   = "#{spec.summary}"
  spec.homepage      = "http://github.com/tubbo/fleck"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_dependency "activesupport"
  spec.add_dependency "activemodel"
  spec.add_dependency "thor"
end
