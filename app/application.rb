
class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      request_item = req.path.split("/items/").last

      @@items.find { |item| item.name == request_item }.tap do |found|
         if found
           resp.write "#{found.price}"
         else
           resp.write "Item not found"
           resp.status = 400
         end
      end

      resp.write "You requested the items"
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end
end
