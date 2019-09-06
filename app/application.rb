require 'pry'

class Application

# @@items = []

def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)
# binding.pry
  if req.path.match(/items/)

    item_requested = req.path.split("/items/").last
    # binding.pry

    if @@items.find {|item| item.name == item_requested}
      resp.write @@items.find {|item| item.name == item_requested}.price
    else
      resp.write "Item not found"
      resp.status = 400
    end
        # binding.pry
  else
    resp.write "Route not found"
    resp.status = 404
  end
  resp.finish

end



end
