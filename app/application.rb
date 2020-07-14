class   Application

      def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

      items = req.path.split("/").reject {|e| e == ""}
      if req.path =='/testing'
       resp.status = 404
       resp.write  "Route not found"
       elsif @@items.select{|item| items[1] == item.name}.empty?
         resp.status = 400
         resp.write "Item not found"
       elsif !@@items.select{|item| items[1] == item.name}.empty?
         @@items.select{|item| items[1] == item.name}.each{|item| resp.write item.price}
     end
         resp.finish

    end
end
