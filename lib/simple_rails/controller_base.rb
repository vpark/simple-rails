require 'erb'
require_relative 'params'
require_relative 'session'
require 'active_support/core_ext'

class ControllerBase
  attr_reader :params

  def initialize(req, res) #, route_params)
    @req = req
    @res = res
   # @routes_params = route_params
    @already_built_response = false
    session
    params
  end
  
  def params
    @params ||= Params.new(@req)
  end

  def session
    @session ||= Session.new(@req)
  end

  def already_rendered?
  end

  def redirect_to(url)
    if @already_built_response == false
      @res.status = 302
      @res["location"] = url 
      @already_built_response = true
      @session.store_session(@res)
    end
  end

  def render_content(body, content_type)
    if @already_built_response == false
      @res.body = body
      @res.content_type = content_type
      @already_built_response = true
      @session.store_session(@res)
    end
  end

  def render(template_name)
    template = File.read("views/#{(self.class.to_s).underscore}/#{template_name}.html.erb")
    erb_template_result = ERB.new(template).result(binding)
    render_content(erb_template_result, "text/html")
  end

  def invoke_action(name)
  end
end
