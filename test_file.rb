require 'uri'
def parse_www_encoded_form(www_encoded_form)
  params = Hash.new
  parsed_array = URI::decode_www_form(www_encoded_form)
    parsed_array.each do |first, last|
      if parse_key(first) == first 
      end
    end
  params
end

def parse_key(key)
  key.split( /\]\[|\[|\]/ )
end

# p parse_www_encoded_form([ ["[cat[name]", "Breakfast"], ["[cat[owner]", "Devon"] ])
p parse_key("cat[name]")

# p parse_key("{"cat[name]": "Breakfast", "cat[owner]": "Devon"}")

=begin
{"cat": {"name": "Breakfast", "owner": "Devon"}}