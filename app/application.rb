class Application
    @@items = []

    def call(env)
        response = Rack::Response.new
        request = Rack::Request.new(env)

        if request.path.match(/items/)
            item_title = request.path.split("/items/").last
            item = @@items.find {|i| i.name == item_title}

            if item
                response.write item.price
            else
                response.status = 400
                response.write "Item not found"
            end
        else
            response.write "Route not found"
            response.status = 404
        end

        response.finish
    end
end
