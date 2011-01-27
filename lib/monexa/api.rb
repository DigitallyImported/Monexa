module Monexa  
  def self.ping
    api_request :ping
  end
  
  def self.list_permissions
    api_request :list_permissions
  end
  
  def self.list_plans(type = 'full')
    api_request :list_plans, {:information_type => type, :provider_id => Monexa::config.provider_id}
  end
  
  def self.api_request(method, data = {})
    request = Request.new(method, data)  
    Response.new request.send
  end
end