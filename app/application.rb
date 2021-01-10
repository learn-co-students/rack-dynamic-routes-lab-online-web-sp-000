class Application 
  @@items = []
  def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new
    if req.path.match(/items/)
      item = req.path.split("/items/").last
      item_detail = @@items.find do |i| 
        i.name == item
      end
      if item_detail
        resp.write item_detail.price
      else
        resp.status = 400
        resp.write "Item not found"
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end