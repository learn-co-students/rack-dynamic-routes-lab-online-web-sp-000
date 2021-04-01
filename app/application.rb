class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    @item_names = @@items.map{|i| "/items/#{i.name}"}
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      if @item_names.include?(req.path)
        resp.write @@items.find{|i| i.name == item_name}.price
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
