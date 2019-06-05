class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.include?('/items/')
      item = req.path.split("/items/").last
      if Item.all.detect {|obj| obj.name == item}
        price = Item.all.detect {|obj| obj.name == item}.price
        resp.write "#{item} cost #{price}"
        resp.status = 200
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write  "Route not found"
      resp.status = 404
    end
    resp.finish
  end


  def handle_item (item)
    if Item.all.detect {|obj| obj.name == item}
      price = Item.all.detect {|obj| obj.name == item}.price
      resp.write "#{item} cost #{price}"
      resp.status = 200
    else
      resp.write "Item not found"
      resp.status = 400
    end
  end
end
