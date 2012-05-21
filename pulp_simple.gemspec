# -*- encoding: utf-8 -*-

require File.expand_path('../lib/pulp_simple/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "pulp_simple"
  gem.version       = PulpSimple::VERSION
  gem.summary       = %q{Simple wrapper around Fedora Pulp REST API}
  gem.description   = %q{Simple wrapper around Fedora Pulp REST API}
  gem.license       = "MIT"
  gem.authors       = ["Steve Abatangle"]
  gem.email         = ['sabat@area51.org']
  gem.homepage      = nil

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rubygems-tasks", "~> 0.2"
  gem.add_development_dependency "rdoc", "~> 3.0"
  gem.add_development_dependency "rspec", "~> 2.4"
  gem.add_development_dependency "json"
  gem.add_development_dependency "yaml"
  gem.add_development_dependency "rest-client"
end
