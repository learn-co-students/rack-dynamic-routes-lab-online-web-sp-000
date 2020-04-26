class Application
    @@items = []
    
    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if !req.path.match(/items/)
            resp.write "Route not found"
            resp.status = 404
        elsif req.path.match(/items/)
            resource = req.path.split("/").last.downcase
            match = @@items.select { |item| item.name.downcase == resource }
            
            if resource == "items"
                resp.write "all items are:\n"
                @@items.each do |item|
                    resp.write "#{item.name} for #{item.price}\n"
                end
            elsif match.empty?
                resp.write "Item not found"
                resp.status = 400
            else
                resp.write "#{match.first.name} for #{match.first.price}\n"
            end
        end

        resp.finish
    end

end
