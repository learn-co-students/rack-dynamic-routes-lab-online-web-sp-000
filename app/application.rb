class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    # if req.path != "/items"
    #   resp.write "Route not found"
    #   resp.status = "404"
    if req.path == "/itemsair"
      resp.write "AIR HERE!"
    elsif req.path == "/items"
      resp.write "Hi there"

    end
    resp.finish
  end
end
