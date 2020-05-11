require 'pry'

class Application 

    @@items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item_name = req.path.split("/").last
            if find_item(item_name) 
                item = find_item(item_name)
                resp.write item.price
            else
                resp.write 'Item not found'
                resp.status = 400
            end 
        else 
             resp.write "Route not found"
             resp.status = 404
        end 

        resp.finish

    end 

    def find_item(item_name)
        #returns the item 
        @@items.detect do |item|
            item.name == item_name 
        end 
    end 

end 