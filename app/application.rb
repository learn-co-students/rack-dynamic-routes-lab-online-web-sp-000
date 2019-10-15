require_relative("item")

class Application
    def call(env)
        res = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item_name = req.path.split("/items").last
            if @@items.include?(item_name)
                item = @@items.find{|i| i.name = item_name}
                res.write("#{item.price}")
            else
                res.write("Item not found")
                res.status = 400 
            end
        else
            res.write("Path not found")
            res.status = 404
        end
        res.finish
    end
end