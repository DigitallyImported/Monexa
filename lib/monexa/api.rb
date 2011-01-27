module Monexa
  
  def self.ping
    api_request :ping
  end
  
  def self.login_available?(login)
    response = api_request :search_subscriber, :login_id => login
    (response.data[:result_size].to_i === 0)
  end
  
  def self.search_subscriber(params)
    api_request :search_subscriber, params
  end
  
  def self.list_plans(type = 'full')
    api_request :list_plans, {:provider_id => Monexa::config.provider[:id], :information_type => type}
  end
  
  def self.api_request(method, data = {})
    request = Request.new(method, data)  
    Response.new request.send
  end
end