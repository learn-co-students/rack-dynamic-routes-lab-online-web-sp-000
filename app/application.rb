require 'pry'

class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      searched_item_name = req.path.split("/items/").last
      searched_item = @@items.find{|item| item.name == searched_item_name}

      if searched_item
        price = searched_item.price
        resp.write price
      else
        resp.status = 400
        resp.write "Item not found"
      end
    else
      resp.status = 404
      resp.write "Route not found"
    end

    resp.finish
  end
end
