class Application
    @@items = [Item.new("Figs",3.42),Item.new("Pears",0.99)]
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.include?("/items/")
            term = req.path.split("/items/").last
            item = @@items.detect {|item| item.name == "#{term}"}
            if !!item
                resp.write "The price of #{item.name} is #{item.price}"
                resp.status = 200
            elsif !item
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