module Monexa
  ENV         = ENV['RAILS_ENV'] || ENV['MONEXA_ENV'] || 'development'
  ROOT        = ENV['RAILS_ROOT'] || ENV['MONEXA_ROOT'] || '.'
  CONFIG_NAME = 'monexa.yml'
  LOG_NAME    = 'monexa.log'
end

$:.unshift(File.dirname(__FILE__))
%w[ version config log error request response api ].each do |file|
  require "monexa/#{file}"
end