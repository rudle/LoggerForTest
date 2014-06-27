# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'logger_for_test'

Gem::Specification.new do |spec|
  spec.name          = 'logger_for_test'
  spec.version       = LoggerForTest::VERSION
  spec.authors       = ['Square']
  spec.email         = ['git@squareup.com']
  spec.summary       = ['A Ruby Logger that stores your log lines in memory.',
                        'Use it in your tests to avoid awkward mocking!'].join
  spec.homepage      = 'https://github.com/rudle/LoggerForTest'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'minitest', '~> 5.3'
  spec.add_development_dependency 'rake', '~> 10.3'
  spec.add_development_dependency 'rubocop', '= 0.24'
end
