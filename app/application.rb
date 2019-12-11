class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      req_item = req.path.split('/items/').last
      item_match = []
      @@items.each do |item|
        if item.name == req_item
          resp.write "#{item.price}"
          item_match << item
        end
      end

      if item_match.empty?
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

# class Application
#   def call(env)
#     resp = Rack::Response.new
#     req = Rack::Request.new(env)
#
#     if req.path=="/songs"
#       resp.write "You requested the songs"
#     else
#       resp.write "Route not found"
#       resp.status = 404
#     end
#
#     resp.finish
#   end
# end
