require 'curb'

module Monexa
  
  class Api
    
    def self.login_available?(login)
      response = api_request :search_subscriber, :login_id => login
      (response.data[:result_size].to_i === 0)
    end
    
    def self.find_user_by_login(login)
      api_request :search_subscriber, :login_id => login
    end
    
    def self.list_plans(type = 'full')
      api_request :list_plans, {:provider_id => Monexa::config.provider[:id], :information_type => type}
    end
    
    #
    # Catch-all to provide generic support for api methods that aren't defined above
    #
    def self.method_missing(sym, *args, &block)
      api_request(sym, args[0]||{})
    end

  private
    
    def self.api_request(method, data = {})
      request = Request.new(method, data)  
      Response.new do_post(Monexa::config.url, request.to_s)
    end
    
    def self.do_post(url, data)
      Monexa::log.debug "POST to #{url}"
      e = Curl::Easy.new(url)
      e.http_post(data)
      e.body_str
    end
    
  end
end
