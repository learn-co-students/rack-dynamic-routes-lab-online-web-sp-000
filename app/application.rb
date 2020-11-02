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
            item = req.params["item"]
            binding.pry
            resp.write check_item(item)
            # @@items.each do |item|
            #    resp.write "#{item.price}\n"
            # end
        elsif 
            resp.write "Route not found"
            resp.status = 404
        end
        resp.finish
    end

    def check_item(item)
        # binding.pry
        if @@items.include?(item)
            @@items.each do |item|
            return "#{item.price}"
            end
        else
            return "Item not found"
        end
    end
end