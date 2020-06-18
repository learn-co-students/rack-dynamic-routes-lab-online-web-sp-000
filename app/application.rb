class Application

  @@items = []

  def self.items
    @@items
  end

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    

    def self.items=(item)
      @@items << all
    end
    
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find{|i| i.name == item_name}
      if item
        binding.pry
        resp.write item.price
      else
        binding.pry
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