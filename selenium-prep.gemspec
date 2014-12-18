# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'selenium-prep/version'

Gem::Specification.new do |spec|
  spec.name          = 'selenium-prep'
  spec.version       = SeleniumPrep::VERSION
  spec.authors       = ['Dave Haeffner']
  spec.email         = ['dhaeffner@gmail.com']
  spec.summary       = %q{See README.txt for details}
  spec.description   = %q{selenium-prep helps set up your machine for local Selenium execution for multiple browsers. It downloads (in parallel) the latest browser drivers and standalone server to a specified location. It will then check your system PATH to see if the directory is in it. If not, it will provide you with information on how to configure it for your operating system.}
  spec.homepage      = 'https://github.com/tourdedave/selenium-prep'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rest-client', '~> 1.7.2'
  spec.add_dependency 'rubyzip', '~> 1.1.6'
  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.1.0'
  spec.add_development_dependency 'guard-rspec', '~> 4.3.1'
end
