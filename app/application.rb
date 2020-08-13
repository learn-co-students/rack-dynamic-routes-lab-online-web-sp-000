class Application
 
    # @@songs = [Item.new("Sorry", "Justin Bieber"),
    #           Item.new("Hello","Adele")]
   
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
   
      if req.path.match(/items/)
   
        item_title = req.path.split("/items/").last #turn /songs/Sorry into Sorry
        item = @@items.find{|s| s.name == item_title}
        if item
            resp.write item.price
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