require 'pry'

class Application 

        def call(env)
            resp = Rack::Response.new
            req = Rack::Request.new(env)
            if req.path.match (/items/)
                item_name = req.path.split("/items/").last
                item = Item.all.select{|a| a.name == item_name}.first
                if item.class == Item
                    resp.write "#{item.price}"
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
