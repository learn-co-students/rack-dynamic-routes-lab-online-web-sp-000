class Application

  #@@items=[]

  def call(env)
    @resp=Rack::Response.new
    req=Rack::Request.new(env)
    #binding.pry
    if req.path.match(/items/)
      name=req.path.split("/items/").last
      @resp.write check_items(name)
    else
      @resp.write "Route not found"
      @resp.status = 404
    end

    def check_items(item)
    #  binding.pry
      if @@items.any?{|t|t.name==item}
        i= @@items.find{|t|t.name==item}
        return i.price
      else
        @resp.status=400
        "Item not found"
      end
    end




    @resp.finish
  end



end
