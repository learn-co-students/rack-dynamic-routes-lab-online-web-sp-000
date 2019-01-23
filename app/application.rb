class application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      
    else
      resp.write "Route not found"
      resp.status = 400
    end

    resp.finish
  end
