class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if !req.path.match(/items/)
      resp.write "Route not found"
      resp.status = 404
    elsif search_term = req.path.split("/items/").last
      if @@items.collect {|item| item.name}.include?(search_term)
        selected_item = @@items.select {|item| item.name = search_term}.first
        resp.write "#{selected_item.price}"
        resp.status = 200
      else
        resp.write "Item not found"
        resp.status = 400    
      end
    end
    resp.finish
    
  end

end