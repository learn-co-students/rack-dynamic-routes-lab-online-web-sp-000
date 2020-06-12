require 'pry'

class Application

   def call(env)
      
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match?(/items/)
      item_name = req.path.gsub("/items/", "")
       item = find_item(item_name)
       if item == nil
         resp.write "Item not found"
        resp.status = 400
        else
         resp.write "#{item.name} #{item.price}"
            resp.status = 200
         end
             else
               resp.write "Route not found"
               resp.status = 404
       end
        resp.finish
    end

  def find_item(item_name)
      @@items.find do |x|
      if x.name == item_name
         return x
       end
      end
    
   end

end