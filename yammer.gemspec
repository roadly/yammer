# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "yammer/version"

Gem::Specification.new do |gem|
  gem.add_runtime_dependency 'yam', '~> 0.0.6'
  gem.authors = ["Bruno Mattarollo"]
  gem.description = %q{A Ruby wrapper for the Yammer REST API}
  gem.email = ['bruno.mattarollo@gmail.com']
  gem.executables = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  gem.files = `git ls-files`.split("\n")
  gem.homepage = 'https://github.com/roadly/yammer'
  gem.name = 'yammer'
  gem.require_paths = ['lib']
  gem.required_rubygems_version = Gem::Requirement.new('>= 1.3.6')
  gem.summary = %q{Ruby wrapper for the Yammer API}
  gem.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.version = Yammer::VERSION.dup
end
