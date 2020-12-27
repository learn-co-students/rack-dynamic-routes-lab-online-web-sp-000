class Application
  
    @@items = []

    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

        if req.path.match(/items/)
            item = req.path.split("/").last
            if @@items.any? {|o| o.name == item}
                selected_item = @@items.select {|o| o.name == item}
                resp.write selected_item[0].price
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
  