class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)

      search_term = req.path.split("/items/").last
      searched_item = @@items.find{ |item| item.name.downcase == search_term.downcase }
      if searched_item
        resp.write "#{searched_item.name} cost #{searched_item.price} each"
      else
        resp.write "Item not found."
        resp.status = 400
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
