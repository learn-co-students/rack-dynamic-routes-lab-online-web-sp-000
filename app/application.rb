class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = req.path_info.split("/items/").last
      @@items.find(item){|i| i.name  == item}.price
      resp.write "#{found_item}\n"
      resp.status = "200"
      binding.pry

    else
      resp.write "Route not found"
      resp.status = "404"
    end

    resp.finish
  end
end
