module Monexa
  module Product
    def self.lookup(data)
      api_request :lookup_product, data
    end
  end
end