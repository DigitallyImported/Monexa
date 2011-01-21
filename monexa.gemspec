lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'monexa'
 
Gem::Specification.new do |s|
  s.name        = 'monexa'
  s.version     = Monexa::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = 'Nick Wilson'
  s.email       = 'wilson.nick@gmail.com'
  s.homepage    = ''
  s.summary     = 'An interface to the Monexa XML API'
  
  s.has_rdoc      = false
  s.require_path  = 'lib'
  s.files         = Dir.glob("{lib,test}/**/*") + %w(README CHANGELOG Rakefile)
  
  s.add_development_dependency 'rspec'
  s.add_dependency 'curb'
  s.add_dependency 'libxml-ruby'
end