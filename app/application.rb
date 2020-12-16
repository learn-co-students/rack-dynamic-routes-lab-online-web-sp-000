require_relative './item'

class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      current_item_name = req.path[7..-1]
      current_item = Item.all.find{|item| item.name == current_item_name}
      if(current_item != nil)
        resp.write current_item.price
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

end 