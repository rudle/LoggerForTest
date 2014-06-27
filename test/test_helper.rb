# encoding: UTF-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

gem 'minitest' # silence a warning
require 'minitest/autorun'
require 'minitest/pride'
