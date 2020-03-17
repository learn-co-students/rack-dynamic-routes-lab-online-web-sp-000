class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_title = req.path.split("/items/").last
      if
        @@items.find{|i| i.name == item_title}
        item = @@items.find{|i| i.name == item_title}
        resp.write "#{item.price}"
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
