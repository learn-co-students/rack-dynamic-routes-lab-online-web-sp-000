require 'pry'

class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match?(/items/)
           
           @@items.each do |i|
           # binding.pry
             if req.path.match?(i.name) && req.path.match?(/items/)
             resp.write "#{i.name} #{i.price}"
             resp.status = 200
            
             elsif !req.path.match?(i.name) && req.path.match?(/items/)
               # binding.pry
                resp.write "Item not found"
                resp.status = 400
                  end

                 end
             
            end
        resp.finish
    end

end