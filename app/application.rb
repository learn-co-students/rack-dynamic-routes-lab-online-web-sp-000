require_relative("item")

class Application
    def call(env)
        res = Rack::Response.new
        req = Rack::Request.new(env)
        if !req.path.match(/items/)
            res.write("Route not found")
            res.status = 404
        else
            item_name = req.path.split("/items/").last
            Item.all.each{|i| puts i.name}
            if !Item.all.find{|i| i.name == item_name}
                res.write("Item not found")
                res.status = 400 
            else 
                item_search = Item.all.find{|i| i.name = item_name}
                res.write("#{item_search.price}")
            end
        end
        res.finish
    end
end