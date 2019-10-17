class Application

  @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path = "/items"
      resp.write
    else
      resp.status = 404
      resp.write "Item not Found"
    end

    resp.finish
  end
  end
