class Application

  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item_name = req.path.match(/\/items\/([^\/]+)/)[1]
      found_item = @@items.find { |item| item.name == item_name } 
      if !found_item.nil?
        resp.write "#{found_item.price}"
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
