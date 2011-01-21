module Monexa  
  class Request
    
    def initialize(command, data = {})
      @command = command.to_s.split('_').collect{|w| w.upcase}.join('_')
      @data = data

      Monexa::log.info "API request: #{@command}"
      Monexa::log.debug "Request Args: #{(data.collect { |k, v| "#{k}=#{v}" }.join(','))}" if @data.length > 0
      
      @xml = build_xml("<#{@command}>#{hash_to_xml(data)}</#{@command}>")
      Monexa::log.debug @xml
    end
    
    def to_s
      @xml
    end
    
    def to_str
      to_s
    end
    
    private
    
    def build_xml(command_xml)
      "<ip_applications_API><api_version>1.0</api_version>
  		<Request>
  			<Authentication>
  				<administrator_login_name>#{Monexa::config.username}</administrator_login_name>
  				<password>#{Monexa::config.password}</password>
  			</Authentication>
  			<Command>#{command_xml}</Command>
  		</Request>
  		</ip_applications_API>"
    end

    def hash_to_xml (h)
      xml = ''
      h.each do |k,v|
        if v.is_a? Hash
          k = k.to_s.split('_').collect {|w| w.capitalize}.join('_')
          xml << "<#{k}>\n#{hash_to_xml(v)}</#{k}>\n"
        else
          xml << "<#{k}>#{v}</#{k}>\n"
        end
      end
      xml
    end
    
  end
end