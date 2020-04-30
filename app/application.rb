class Application

  @@items = []

  def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

      if req.path.match(/items\/.+/)
        requested_item = req.path.split("/items/").last
        detected_item = @@items.detect{|i| i.name == requested_item}
        if detected_item
          resp.write detected_item.price
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
