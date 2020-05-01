class Application 

    @@items = [] 

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            item_name = req.path.split('/items/').last
            item = search_item(item_name)
            if !!item
                resp.write "#{item.name} price is #{item.price}"
                resp.status = 200
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

    def search_item(item_name)
        @@items.detect{|item| item.name == item_name}
    end
 
end