require 'xml'

module Monexa
  class Response

    STATUS_REGEX = {
      :success => '0([0-9]{3})',
      :error => '1([0-9])([0-9]{2})',
      :fatal => '2([0-9]{3})'
    }

    attr_reader :status, :data, :raw_xml
    
    def initialize(xml)
      if Monexa::config.dry_run
        @status = {:code => '0000', :description => 'Dry Run, no response processed'}
      else
        @raw_xml = xml
        parse_response @raw_xml
      end
    end
    
    def success?
      @status[:code].match(STATUS_REGEX[:success]) != nil
    end
    
    def warning?
      m = @status[:code].match(STATUS_REGEX[:success])
      m && m[1].to_i > 0
    end
    
    def error?
      @status[:code].match(STATUS_REGEX[:error]) != nil
    end
    
    def fatal?
      @status[:code].match(STATUS_REGEX[:fatal]) != nil
    end
    
    private
    
    def parse_response(xml)
      Monexa::log.debug 'Parsing response xml...'
      response = {}
      parser = XML::Parser.string xml
      parser.context.options = XML::Parser::Options::NOBLANKS | XML::Parser::Options::NOERROR |
                               XML::Parser::Options::RECOVER | XML::Parser::Options::NOWARNING
                                
      parser.parse.find('//Response').each do |node|
        response = xml_node_to_hash(node)
      end
      
      raise ResponseError.new 'Invalid response from server' unless response and response.include? :status
      
      Monexa::log.info "Response status: #{response[:status][:description]} (#{response[:status][:code]})"
      
      response.each do |k, v|
        if k == :data
          v.each do |command, data|
            @command = command
            @data = data
            #data.each do |dk, dv|
            #  instance_variable_set("@#{dk}", dv)
            #  instance_eval("class << self; attr_accessor :#{dk}; end")
            #end
          end
        else
          instance_variable_set("@#{k}", v)
          instance_eval("class << self; attr_accessor :#{k}; end")
        end
      end
    end
    
    def xml_node_to_hash(node)
      result = {}

      if node.element? && node.children? && node.children[0].element?
        node.children.each do |child|
          sym_name = child.name.downcase.sub('response_', '').to_sym
          if result.include? sym_name
            result[sym_name] = [result[sym_name]] unless result[sym_name].is_a? Array
            result[sym_name].push xml_node_to_hash(child)
          else
            result[sym_name] = xml_node_to_hash(child)
          end
        end
        result
      else
        node.content.strip
      end
    end
    
  end
end