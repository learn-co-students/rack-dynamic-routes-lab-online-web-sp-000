class Application

    @@items = [Item.new("Apples",5.23), Item.new("Oranges",2.43)]
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
  
      if req.path.match(/items/)
        item_name = req.path.split("/items/").last #paths are strings, we can do a regex match against the path.
        # Then we just grab the content after the /item/ to figure out which Item our user would like.
        ##turn /items/Apples into Apples
        if item =@@items.find{|i| i.name == item_name}
          resp.write item.price
        else 
          resp.status = 400
          resp.write "Item not found"
        end
      else
        resp.status=404
        resp.write "Route not found"
      end
      resp.finish
    end
  
  end