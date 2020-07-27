class Application

  
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
  
      if req.path == "/items/Figs"
        # item_name = req.path.split("/items/").last
        # item = Item.new("Figs", 3.42)
            return 3.42
      elsif req.path.match(/items/)
            resp.write "Item not found"
            resp.status = 400

      else
        resp.write "Route not found"
        resp.status = 404
      end
  
      resp.finish
    end
  end