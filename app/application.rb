class Application
  
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
      
      
      if req.path.match(/items/)
        item_from_path = req.path.split("/items/").last
        puts item_from_path

        @@items.each { |item| puts item.name == item_from_path}
        item_found = @@items.find{ |item| 
        item.name == item_from_path}
        puts "found item" + item_found.to_s
        if( item_found != nil)
            resp.write item_found.price
            resp.status = 200
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
  