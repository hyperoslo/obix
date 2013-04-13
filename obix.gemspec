# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'obix/version'

Gem::Specification.new do |gem|
  gem.name          = "obix"
  gem.version       = OBIX::VERSION
  gem.authors       = ["Johannes Gorset"]
  gem.email         = ["jgorset@gmail.com"]
  gem.description   = "oBIX parser"
  gem.summary       = "oBIX parser"
  gem.homepage      = "http://github.com/hyperoslo/ruby-obix"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "rake"
  gem.add_development_dependency "mocha"
  gem.add_development_dependency "guard"
  gem.add_development_dependency "guard-minitest"
  gem.add_development_dependency "rb-inotify"
  gem.add_development_dependency "rb-fsevent"
  gem.add_development_dependency "rb-fchange"
  gem.add_runtime_dependency "nokogiri"
  gem.add_runtime_dependency "rdf-xsd"
  gem.add_runtime_dependency "equivalent-xml"
  gem.add_runtime_dependency "activesupport"
end
