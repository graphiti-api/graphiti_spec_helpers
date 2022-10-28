# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'graphiti_spec_helpers/version'

Gem::Specification.new do |spec|
  spec.name          = "graphiti_spec_helpers"
  spec.version       = GraphitiSpecHelpers::VERSION
  spec.authors       = ["Lee Richmond"]
  spec.email         = ["lrichmond1@bloomberg.net"]

  spec.summary       = %q{Spec helpers for Graphiti and JSONAPI}
  spec.description   = %q{Easily test JSONAPIs and Graphiti Resources}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "graphiti", '>= 1.0.alpha.1'
  spec.add_dependency "rspec", "~> 3.0"

  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "actionpack", "~> 5.0"
  spec.add_development_dependency "rake", "~> 13"
end
