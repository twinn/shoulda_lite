# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'shoulda_lite/version'
 
Gem::Specification.new do |s|
  s.name        = "shoulda_lite"
  s.version     = ShouldaLite::VERSION
  s.authors     = ["Tony Winn"]
  s.email       = ["hi@tonywinn.me"]
  s.homepage    = "http://github.com/twinn/shoulda_lite"
  s.summary     = "Isolate your active record specs without deleting your shoulda expectations."
 
  s.add_runtime_dependency "rspec"
 
  s.files = Dir.glob("{lib,spec}/**/*") + %w(README.md)
  s.require_path = 'lib'
end
