require 'pry'

#=begin
class Application

    @@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)]

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        
        if req.path.match(/items/)
            item_name = req.path.split("/items/").last 
            item = @@items.find {|i| i.name == item_name}
            if item
                resp.write item.price
            else
                resp.write "Item not found"
                resp.status = 400
            end
            #binding.pry
=begin
        elsif req.path.match(/items/)
            item_name = req.path.split("/items/").last
            !@@items.include?(item_name) 
            resp.write "Item not found"
            resp.status = 400
            #binding.pry
=end
        else
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
        #binding.pry
    end
    
end
#=end

=begin
class Application

    @@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)]

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        
        if req.path.match(/items/)
           item_name = req.path.split("/items/").last
           !@@items.include?(item_name)
           resp.write "Item not found"
           resp.status = 400
           #binding.pry
        elsif req.path.match(/items/)
            item_name = req.path.split("/items/").last 
            item = @@items.find {|i| i.name == item_name}
            resp.write item.price
        else
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
        #binding.pry
    end
    
end
=end