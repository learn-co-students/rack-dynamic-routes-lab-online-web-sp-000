class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.include?("/items/")
      item_name = req.path.split("/items/").last
      if !!has_item?(item_name)
        returned_item = has_item?(item_name)
        resp.write "#{returned_item.price}"
      else
        resp.write "Item not found"
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end

  def has_item?(item_name)
    the_item = nil
    @@items.each do |item|
      if item.name == item_name
        the_item = item
      end
    end
    the_item
  end
end
