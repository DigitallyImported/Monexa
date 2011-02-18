module Monexa
  VERSION     = '0.3.0'
  ENV         = ENV['RAILS_ENV'] || ENV['MONEXA_ENV'] || 'development'
  ROOT        = ENV['RAILS_ROOT'] || ENV['MONEXA_ROOT'] || '.'
  CONFIG_NAME = 'monexa.yml'
  LOG_NAME    = 'monexa.log'
  
  ApiError      = Class.new(RuntimeError)
  RequestError  = Class.new(ApiError)
  ResponseError = Class.new(ApiError)
end

$:.unshift(File.dirname(__FILE__))
%w[ config log flag util request response api ].each do |file|
  require "monexa/#{file}"
end