# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bcycle/version'

Gem::Specification.new do |gem|
  gem.name          = "bcycle"
  gem.version       = Bcycle::VERSION
  gem.authors       = ["Bryan Shelton"]
  gem.email         = ["bryan@sheltonplace.com"]
  gem.description   = %q{A Simple Bcycle API library}
  gem.summary       = %q{A Ruby library for accessing the B-Cycle API}
  gem.homepage      = "https://github.com/bshelton229/bcycle-ruby"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  # Dependencies
  gem.add_dependency('json')

  # Development Dependencies
  gem.add_development_dependency('rspec')
end
