# require 'pry'

class Application 

  
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new(env)
    
    if req.path.match(/items/)
      item_name = req.path.split('/').last 
      found_item = @@items.find {|i| i.name == item_name}
      
      if found_item
        resp.write found_item.price
      else 
        resp.write "Item not found"
        resp.status = 400
      end 
    else 
      resp.status = 404
      resp.write "Route not found"
    end 
    
    resp.finish
  end 
  #Submit attempt
end 