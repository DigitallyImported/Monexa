module Monexa
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