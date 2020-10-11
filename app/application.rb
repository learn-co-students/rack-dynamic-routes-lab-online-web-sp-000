require 'pry'

class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item_name = req.path.split("/items/").last
            found = false
            item = nil
            @@items.each do | i |
                if i.name == item_name
                    found = true
                    item = i
                end
            end
            if found
                resp.write "#{item.price}"
                resp.finish
            else
                resp.write "Item not found"
                resp.status = 400
                resp.finish
            end
        else
            resp.status = 404
            resp.write "Route not found"
            resp.finish
        end

    end

end