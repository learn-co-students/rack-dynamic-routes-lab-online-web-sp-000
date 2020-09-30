require 'pry'
class Application
  
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.split("/").last

      @@items.collect do |i|   
        if i.name == item_name
          resp.write "#{i.price}"
          resp.status = 200
        else
      #binding.pry
          resp.write "Item not found"
          resp.status = 400
        end
      end

    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end