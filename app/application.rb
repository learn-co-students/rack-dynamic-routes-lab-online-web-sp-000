class Application

    # @items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
        
            # turn /items/[item] into [item_name]
            item_name = req.path.split("/items/").last
            desired_item = @@items.find{|i| i.name == item_name}
            binding.pry
            if desired_item != nil
                resp.write desired_item.price
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