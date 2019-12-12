class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    #get '/items/Figs'
    #get '/items/Apples'

    if req.path.start_with? "/items"
      item = req.path.split("/").last
      chosen_item = @@items.detect { |i| i.name == item }
      if chosen_item.nil?
        resp.write "Item not found"
        resp.status = 400
      else
        resp.write "#{chosen_item.price}"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end

    resp.finish
  end
end
