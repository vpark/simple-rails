require 'uri'

class Params
  def initialize(req)#, route_params)
    query_string = req.query_string
    req_body = req.body
    
    @params = parse_www_encoded_form(req_body)

  end

  def [](key)
    
  end

  def to_s
    @params.to_s
  end

  private
  def parse_www_encoded_form(www_encoded_form)
    params = Hash.new
    parsed_array = URI::decode_www_form(www_encoded_form)
      parsed_array.each do |first, last|
        params[first] = last
      end
    params
  end

  def parse_key(key)
  end
end

#look up how to read the request body
  #assume that the request body is also in url encoded format
  