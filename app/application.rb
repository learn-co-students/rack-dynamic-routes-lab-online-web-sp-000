require 'pry'
class Application
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        #binding.pry
        if req.path.include?("/items")
            #binding.pry
            @item_path = req.path.split("/items/")[1]
            item_found = @@items.find do |item|
                item.name == @item_path
            end
            if item_found
                resp.write "#{item_found.price}"
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