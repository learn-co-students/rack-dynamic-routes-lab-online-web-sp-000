class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match"/items/"
      if @@items.include?(@@item)
        item_price = @@item[1]
        resp.write write item_price
      elsif @@items.include?!(@@item)
        resp.write "Route not found"
        resp.status = 400
      else
        resp.write "Route not found"
        resp.status = 404
      end
    end

    resp.finish
  end
end
