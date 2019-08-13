class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env) # => req.path gives the route for the address (ie /items/figs)

    if req.path.match (/items/)
      item_name = req.path.split("/items/").last
      item = @@items.find{|t| t.name == item_name}
      if item.nil?
        resp.write "Item not found"
        resp.status = 400
      else
       resp.write item.price
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end


# class Application
#
# @@items = []
#
#   def call(env)
#     resp = Rack::Response.new
#     req = Rack::Request.new(env)
#
#     if req.path.match(/items/)
#       item_name = req.path.split("/items/").last
#       item = @@items.find{|i| i.name == item_name}
#       if item.nil?
#         resp.write "Item not found"
#         resp.status = 400
#       else
#         resp.write item.price
#       end
#     else
#       resp.write "Route not found"
#       resp.status = 404
#     end
#
#     resp.finish
#   end
# end
