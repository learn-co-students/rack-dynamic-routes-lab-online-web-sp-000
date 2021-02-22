class Application
 
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
   
      if req.path=="/items"
        resp.write "#{item.price}"
      elsif 

        resp.status = 400
      else
        resp.write "Route not found"
        resp.status = 404
      end
   
      resp.finish
    end
  end