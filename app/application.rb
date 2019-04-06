class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
      if req.path.match(/items\/.+/)
        desired_item = req.path.split("/").last
        found_item = Item.all.detect {|x| x.name == desired_item}
        if found_item != nil
          resp.write found_item.price
        else
          resp.status = 400
          resp.write "Item not found"
        end
      else
        resp.status = 404
        resp.write "Route not found."
      end
    resp.finish
  end
end
