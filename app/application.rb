class Application

  #@@items=[]

  def call(env)
    resp=Rack::Response.new
    req=Rack::Request.new(env)
    #binding.pry
    if req.path.match(/items/)
      name=req.path.split("/items/").last
      if i=@@items.find{|t|t.name==name}
        resp.write i.price
      else
        resp.status=400
        resp.write "Item not found"
      end
    else
      resp.write "Route not found"
      resp.status = 404
    end
    resp.finish
  end

end
