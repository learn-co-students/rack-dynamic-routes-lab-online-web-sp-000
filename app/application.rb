class Application
  @@items = []
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      requested_item = req.path.split("/items/").last
      if item = @@items.find{ |item| item.name == requested_item }
        resp.status = 200
        resp.write "#{item.price}"
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end
    resp.finish
  end
  
end