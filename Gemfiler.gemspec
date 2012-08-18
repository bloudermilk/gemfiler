# -*- encoding: utf-8 -*-
require File.expand_path('../lib/Gemfiler/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Robert Ross"]
  gem.email         = ["robert@creativequeries.com"]
  gem.description   = %q{Gemfiler makes your Gemfile pretty.}
  gem.summary       = %q{Gemfiler knows how to make Gemfiles organized and reader friendly.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^spec/})
  gem.name          = "Gemfiler"
  gem.require_paths = ["lib"]
  gem.version       = Gemfiler::VERSION

  gem.add_development_dependency('rspec', '~> 2.11')
end