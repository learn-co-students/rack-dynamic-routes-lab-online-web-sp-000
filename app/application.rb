require 'pry'

class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      item_name = req.path.split("/items/").last
      item_there?(item_name) ? display_price(resp, item_name) : display_message_400(resp)
    else
      display_message_404(resp)
    end

    resp.finish
  end

  def item_there?(item_name)
    @@items.any? { |item| item.name == item_name}
  end

  def display_price(resp, item_name)
    resp.write "#{@@items.find { |item| item.name == item_name}.price.to_f}"
  end

  def display_message_404(resp)
    resp.write "Route not found"
    resp.status = 404
  end

  def display_message_400(resp)
    resp.write "Item not found"
    resp.status = 400
  end
end