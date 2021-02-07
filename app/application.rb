

class Application
    
    @@items = [Item.new('Figs', 3.42)]

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
    
        if req.path.match(/items/)
           requested_item = req.path.split('/').last
             if inventoried_item = @@items.detect{|item| item.name == requested_item}
                resp.write inventoried_item.price
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

    