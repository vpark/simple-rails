require 'json'
require 'webrick'

class Session
  def initialize(req)
    req.cookies.each do |cookie|
      if cookie.name == '_simple_rails_app'
        @cookie = JSON.parse cookie.value
      end
    end
    @cookie = {} if @cookie.nil?
  end

  def [](key)
    @cookie[key]
  end

  def []=(key, val)
    @cookie[key] = val
  end

  def store_session(res)
    session_cookie = WEBrick::Cookie.new('_simple_rails_app', @cookie.to_json)
    res.cookies << session_cookie
  end
end
