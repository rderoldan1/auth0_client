# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'auth0_client/version'

Gem::Specification.new do |spec|
  spec.name          = "auth0_client"
  spec.version       = Auth0::VERSION
  spec.authors       = ["Ruben Espinosa", "Mateo Vidal"]
  spec.email         = ["rderoldan1@gmail.com", "jvidalba@gmail.com"]
  spec.summary       = %q{Ruby client for Auth0 API.}
  spec.description   = %q{Ruby client for Auth0 API.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency 'httparty'

end
