require 'pry'
class Application
 
    @@items = []
   
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        # binding.pry
        item_name = req.path.split("/items/").last 
        if req.path == "/items/#{item_name}"       
            item = @@items.find{|i| i.name== item_name}
            if item != nil
                resp.write item.price
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