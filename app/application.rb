class Application
  # @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      item = find(req.path.gsub('/items/', ''))
      # binding.pry
      if @@items.include?(item)
        resp.write(item.price)
        resp.status = 200
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

  def find(name)
    @@items.find {|item| item.name == name}
  end

end