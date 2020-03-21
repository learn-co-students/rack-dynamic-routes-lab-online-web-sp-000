class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path_info.split("/items/").last
      found_item = @@items.find() do |i|
        i.name  == item
      end
      if found_item != nil
        resp.write "#{item}: #{found_item.price}\n"
        resp.status = "200"
      else
        resp.write "Item not found"
        resp.status = "400"
      end
    else
      resp.write "Route not found"
      resp.status = "404"
    end

    resp.finish
  end
end
