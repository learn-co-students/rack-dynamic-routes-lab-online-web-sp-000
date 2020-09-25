class Application
  
  @@items = []
  def call(env)
    resp = Rack::Response.new 
    req = Rack::Request.new(env)
    
    if req.path[0,6] == "/items"
    #   #binding.pry
    # @@items.each do |item|
    #     #binding.pry
    #     if @name == item
    item_name = req.path.split("/items/").last
        if item =@@items.find{|i| i.name == item_name}
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
