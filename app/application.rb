class Application
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    item_name = req.path.split(/\//)[2]
    
    if item_name
      item_object = @@items.detect {|i| i.name == item_name}
      if item_object
        resp.write item_object.price
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
  
end

# class Application 
  
#   def call(env)
    
#     resp = Rack::Response.new
#     req = Rack::Request.new(env)
    
#     path = req.path.gsub(/^\//, "").split("/")
        
#     if path.length == 2
#       item = @@items.detect {|i| i.name == path[1]}
#       if item
#         resp.write item.price
#       else
#         resp.write "Item not found"
#         resp.status = 400
#       end
#     else
#       resp.write "Route not found"
#       resp.status = 404
#     end
    
#     resp.finish
#   end
  
# end