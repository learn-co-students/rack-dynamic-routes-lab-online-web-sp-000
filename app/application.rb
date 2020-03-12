class Application

  @@items = [] 
 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    found = false

    @@items.each do |i|
      if req.path == "/items/#{i.name}"
        resp.write i.price.to_s
        resp.status = 200
        found = true
      end
    end

    if found == false
      if req.path.match(/items/)
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write "Route not found"
        resp.status = 404
      end
    end
    
    resp.finish
  end
end