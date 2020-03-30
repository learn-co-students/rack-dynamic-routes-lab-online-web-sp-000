require "./app/item.rb"

class Application

    @@items = []

    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)

      correct_price = 0 

      if req.path.match(/items/)
        item_name = req.path.split("/items/").last
        @@items.each do |item|
            if item.name == item_name
                correct_price = item.price
            end
        end
        if correct_price > 0 
            resp.write "#{correct_price}"
            resp.status = 200
        elsif correct_price == 0 
            resp.write "Error: Item not found"
            resp.status = 400
        end 
    else 
        resp.status = 404 
        resp.write "Route not found"
    end

    # def handle_search(search_term)
    #   if @@items.include?(search_term)
    #     return "#{search_term} is one of our items"
    #   else
    #     return "Couldn't find #{search_term}"
    #   end
    # end

    resp.finish

    end 

end

