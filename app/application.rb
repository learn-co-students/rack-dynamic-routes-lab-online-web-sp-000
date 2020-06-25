require 'pry'
class Application

        @@items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
         search_query = req.path.split("/items/").last   
            a = @@items.detect{ |i| i.name == search_query}
            if a.class == Item
                resp.write "#{a.price}"
                resp.status = "200"
            else
                resp.write "Item not found"
                resp.status = "400"
            
            end
        else
            
            resp.write "Route not found"
            resp.status = "404"
        end
        resp.finish
    end
end