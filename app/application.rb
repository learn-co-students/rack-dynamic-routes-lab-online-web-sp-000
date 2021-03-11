class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      selected_item = req.path.split("/items/").last
      item_names = @@items.map{|i| i.name}
      if item_names.include?(selected_item)
        item_to_display = @@items.find{|i| i.name == selected_item}
        resp.write item_to_display.price
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
