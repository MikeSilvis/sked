# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sked/version'

Gem::Specification.new do |spec|
  spec.name          = 'sked'
  spec.version       = Sked::VERSION
  spec.authors       = ['Mike Silvis']
  spec.email         = ['mikesilvis@gmail.com']
  spec.summary       = %q{Cron jobs made simple.}
  spec.description   = %q{Cron jobs made extremely simple.}
  spec.homepage      = 'http://mikesilvis.com'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'byebug', '~> 3.3.0'
  spec.add_dependency 'puma', '~> 2.9.0'
  spec.add_dependency 'redis', '~> 3.1'
  spec.add_dependency 'sidekiq', '~> 3.2.2'
  spec.add_dependency 'hashie', '~> 3.3.1'
  spec.add_dependency 'heroku', '~> 3.10.3'
  spec.add_dependency 'sinatra', '~> 1.4.5'
  spec.add_dependency 'thor', '~> 0.19.1'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rspec', '~> 2.14.1'
  spec.add_development_dependency 'rake', '~> 10.3.2'
  spec.add_development_dependency 'foreman', '~> 0.75.0'
end
