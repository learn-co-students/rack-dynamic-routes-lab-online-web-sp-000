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
            # binding.pry
            path = req.path
            item = path.split("/").last
            # binding.pry
            check_item(item, resp)

        end

        if !req.path.match(/items/)
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
    end

    def check_item(item, response) # highlight all rows and type command+? to comment or uncomment out multiple lines
        # binding.pry
       if returned_item = @@items.find { |i| i.name == item }
            response.write returned_item.price
       else
            response.write "Item not found"
            response.status = 400
        end
    end
end
