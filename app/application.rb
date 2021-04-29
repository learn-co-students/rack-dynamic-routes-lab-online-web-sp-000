require 'pry'
class Application
  # @@items = [Item.new("Apples",5.23), Item.new("Oranges",5.23)]
	def call(env)
  	resp = Rack::Response.new
  	req = Rack::Request.new(env)
  # 	binding.pry
  	if req.path.match(/items/)
  	  item_name = req.path.split("/items/").last #hand the split method the pieces of the elements to separate
  	  if item =  @@items.find{|item| item.name == item_name} 
  	    resp.write item.price
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

