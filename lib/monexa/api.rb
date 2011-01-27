module Monexa  
  def self.ping
    api_request :ping
  end
  
  def self.list_plans(type = 'full')
    api_request :list_plans, {:provider_id => Monexa::config.provider[:id], :information_type => type}
  end
  
  def self.api_request(method, data = {})
    request = Request.new(method, data)  
    Response.new request.send
  end
end