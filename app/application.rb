class Application
    @@items = ["Figs", "Pears", "Apples"]

    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
    

      if req.path.match(/items/)
        new_item = req.path.split("/").last
        item = @@items.select{|i| i.name == new_item}.first
       
        # new_item = req.params["item"]
          if item
            resp.write "#{item.price}"
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

end

