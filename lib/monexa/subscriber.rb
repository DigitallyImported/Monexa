module Monexa
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
end