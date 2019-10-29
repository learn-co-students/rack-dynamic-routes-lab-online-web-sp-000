class Application

def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new

  if req.path == "/items/<ITEM NAME>"
  else
    resp.write "Route not found"
    resp.status = 404
  end
end

end
