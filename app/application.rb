class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path = "/items"
      resp.write
    else
      resp.write "Request not Found"
      resp.status = 404
    end

    resp.finish
  end
