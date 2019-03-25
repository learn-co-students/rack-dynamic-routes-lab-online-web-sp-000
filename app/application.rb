class Application

  @@items = []

  def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)

   if req.path.match(/items/)
    item_request = req.path.split("/items/").last
      if item_found = @@items.find do |i|
         i.name == item_request
      end
      resp.write item_found.price
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
