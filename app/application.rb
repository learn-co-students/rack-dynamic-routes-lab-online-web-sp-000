
class Application
   #item1 = Item.new("apple", 2)
   # item2 = Item.new("orange", 3)
def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    
    route_arr = req.path.split("/items/")
    item_name = route_arr.last
    if route_arr.size != 2
        resp.write "Route not found"
        resp.status = 404
    else
      item = Item.all.find{|item| item.name == item_name}
      if item
        resp.write "Price: #{item.price}"
      else
        resp.write "Item not found"
        resp.status = 400
      end
    end
    resp.finish
end

end