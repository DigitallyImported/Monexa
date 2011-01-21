require 'yaml'
require 'ostruct'

module Monexa
  
  def self.config_file
    path = File.join(ROOT, 'config')
    path = '.' unless File.directory?(path)
    File.expand_path(File.join(path, CONFIG_NAME))
  end

  def self.init_config(config = nil)
    path = File.expand_path(config||config_file)
    raise "Failed to locate configuration file '#{CONFIG_NAME}', place in 'config/' or '.'" unless File.readable?(path)
    Monexa::log.debug "Using configuration file '#{path}'"
    @config = OpenStruct.new(YAML.load_file(path)) unless @config
    @config
  end

  def self.config
    init_config unless @config
    @config
  end
  
  def self.config=(config)
    init_config(config)
  end
end