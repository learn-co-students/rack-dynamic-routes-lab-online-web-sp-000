require 'pry'

class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
# binding.pry
    if req.path.match(/items/)

      item_name = req.path.split("/items/").last

      if item = @@items.find{|i| i.name == item_name}
        resp.write item.price
      else
        resp.write "400 Item not found"
        resp.status = 400
      end

    else
      # binding.pry
      resp.write "404 Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
