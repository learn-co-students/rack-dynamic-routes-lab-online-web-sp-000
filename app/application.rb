class Application
  @@items = []
  
  def call(env)
    rqst = Rack::Request.new(env)
    rspns = Rack::Response.new
    # rqst = Rack::Request.new(env)        #does it matter which goes first nope....!
    
    if rqst.path.include?("/items")
      item_name = rqst.path.split("/items/").last
      item_oi = @@items.find {|item| item.name == item_name}
      if item_oi 
        rspns.write item_oi.price
      else
        rspns.status = 400
        rspns.write "Item not found"
      end
    else
      rspns.status = 404
      rspns.write "Route not found"
    end
    rspns.finish                            #super important!!
  end
  
end