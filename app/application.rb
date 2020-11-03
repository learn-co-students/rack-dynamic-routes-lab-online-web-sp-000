class Application 
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
   
      if req.path.match(/items/) # if route is /items
        item_name = req.path.gsub("/items/", "") # get text after '/items/'
        item = Item.find_by_name(item_name) # look for item in Item @@all

        if item # if item is an Item instance (not nil)
          resp.write "#{item.price}"
        else # else item not found error
          resp.status = 400
          resp.write "Item not found"
        end

      else # any other route
        resp.write "Route not found"
        resp.status = 404
      end
   
      resp.finish
    end
end