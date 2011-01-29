module Monexa
  
  def self.api_request(method, data = {})
    request = Request.new(method, data)  
    Response.new request.send
  end
  
  def self.ping
    api_request :ping
  end
  
  def self.list_permissions
    api_request :list_permissions
  end
  
  module Product
    def self.lookup(data)
      api_request :lookup_product, data
    end
  end
  
  module Plan
    def self.list(data)
      api_request :list_plans, data
    end
  end
  
  module Subscriber
    def self.create(data)
      Monexa::api_request :create_subscriber, data
    end
    
    def self.update(data)
      Monexa::api_request :update_subscriber, data
    end
    
    def self.check_password(data)
      Monexa::api_request :check_password, data
    end
    
    def self.login_available?(login)
      response = Monexa::api_request :search_subscriber, :login_id => login
      (response.data[:result_size].to_i === 0)
    end
  
    def self.search(data)
      Monexa::api_request :search_subscriber, data
    end
  end
  
  module SessionKey
    def self.get(data)
      Monexa::api_request :get_session_key, data
    end
    
    def self.list(data)
      Monexa::api_request :list_session_key, data
    end
    
    def self.validate(session_key)
      Monexa::api_request :validate_session_key, :session_key => session_key
    end
  end
  
end