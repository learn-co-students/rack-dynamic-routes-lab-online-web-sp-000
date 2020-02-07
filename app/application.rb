class Application
   
   @@items = []

    def call(env)
        req = Rack::Request.new(env)
        resp = Rack::Response.new
        
        if req.path.match(/items/)
            item_name = req.path.split("/").last
            item = @@items.find{|i| i.name == item_name}
            if item.nil?
                resp.status = 400
                resp.write "Item not found"
            else
                resp.write "The price of #{item.name} is $#{item.price}"
            end

        else
            resp.status = 404
            resp.write "Route not found"
        end

        resp.finish
    end
end