# Your application should only accept the /items/<ITEM NAME> route. Everything else should 404
# If a user requests /items/<Item Name> it should return the price of that item
# IF a user requests an item that you don't have, then return a 400 and an error message
require 'pry'
class Application

    @@items = ["Apples", "Carrots", "Pears", "Figs"]

    def call(env)

        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            path = req.path
            item = path.split("/")[2]
            resp.write check_item(item)
        end

        if !req.path.match(/items/)
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
    end

    def check_item(item) # highlight all rows and type command+? to comment or uncomment out multiple lines
        # binding.pry
       if returned_item = @@items.find { |i| i.name == item }
            return "#{returned_item.price}"
       else
            return "Item not found"
            return Rack::Response.new.status = 400
        end
    end
end
