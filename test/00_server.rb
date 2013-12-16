require 'active_support/core_ext'
require 'webrick'
require 'simple_rails'

# http://www.ruby-doc.org/stdlib-2.0/libdoc/webrick/rdoc/WEBrick.html
# http://www.ruby-doc.org/stdlib-2.0/libdoc/webrick/rdoc/WEBrick/HTTPRequest.html
# http://www.ruby-doc.org/stdlib-2.0/libdoc/webrick/rdoc/WEBrick/HTTPResponse.html
# http://www.ruby-doc.org/stdlib-2.0/libdoc/webrick/rdoc/WEBrick/Cookie.html
server = WEBrick::HTTPServer.new :Port => 8080 #creating a server here!
trap('INT') { server.shutdown }

class MyController < ControllerBase
  def go
    # render_content("hello world!", "text/html")

    # after you have template rendering, uncomment:
#    render :show

    # after you have sessions going, uncomment:
    # session["count"] ||= 0
 #    session["count"] += 1
 #    render :counting_show
  end
  
  def go2
    redirect_to("http://google.com")
  end
end

server.mount_proc '/' do |req, res| #where server actually starts listening
 MyController.new(req, res).go     #mount_proc - the server will run this block every time it                                                          receives a request
  #MyController.new(req, res).go2      
end

server.start
