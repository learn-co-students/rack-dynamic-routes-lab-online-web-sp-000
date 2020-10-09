class Application

    #Rack default status code is 200

    def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

        if req.path.match(/items/) #req.path=="/items"
            item_ = req.path.split("/items/").last
            item = @@items.find{|i| i.name == item_}

            if @@items.include?(item)
                resp.write item.price
            else
                resp.write "Item not found"
                resp.status = 400
            end
            #end
        else
            resp.write "Route not found"
            resp.status = 404
        end

    resp.finish
    
    end

end