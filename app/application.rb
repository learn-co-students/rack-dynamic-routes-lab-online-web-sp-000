require 'pry'
class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      # Get the request's parameters
      item = req.path.split(/\/items\//).reject! {|i| i == ""}[0]
      #binding.pry
      price = 0
      @@items.each {|i| price = i.price if i.name == item}
      if price == 0
        resp.status = 400
        resp.write "Item not found"
      else
        resp.write price
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
