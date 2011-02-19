module Monexa
  module Subscriber
    def self.create(data)
      Monexa::api_request :create_subscriber, wrap_account(data)
    end

    def self.update(data)
      Monexa::api_request :update_subscriber, wrap_account(data)
    end

    def self.delete(account_id)
      update(:account_information => {:account_id => account_id, :account_status => 'deleted'})
    end

    def self.check_password(data)
      Monexa::api_request :check_password, wrap_account(data)
    end

    def self.login_available?(login)
      response = Monexa::api_request :search_subscriber, :login_id => login
      response.data[:result_size].to_i === 0
    end

    def self.search(data)
      Monexa::api_request :search_subscriber, data
    end

    def self.find(account_id)
      Monexa::api_request :lookup_subscriber, :account_id => account_id
    end
    
    def self.lookup(data)
      Monexa::api_request :lookup_subscriber, data
    end

    def self.wrap_account(data)
      data = { :subscriber_information => data } unless data.has_key?(:subscriber_information) 
      data[:subscriber_information][:account_information][:provider_id] ||= Monexa::config.provider_id
      data
    end
    
  end
end