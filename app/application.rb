require "pry"
class Application

  def call(env)
    res = Rack::Response.new
    req = Rack::Request.new(env)
    execute(req, res)
    res.finish
  end

  def execute(req, res)
    path = req.path
    if path.match(/items/)
      item_name = path.split('items/').last
      item = @@items.find {|i| i.name == item_name }
      if @@items.include?(item)
        res.write item.price
      else
        res.status = 400
        res.write "Item not found"
      end
    else
      res.status = 404
      res.write "Route not found"
    end
  end

end