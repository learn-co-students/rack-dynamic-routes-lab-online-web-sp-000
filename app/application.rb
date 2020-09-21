class Application
    @@items = [] 

    def call(env)
        #note: were not using the resp = Rack::Response.new
        #we're returning this kind of format [400, {"Content-Type" => html/text}, ["Item not found"]]  
        #i think the rack::response thing make that for you, u just type the content
        #here u make the whole thing yourself
        #get the path:
        req = Rack::Request.new(env)
        #process path:
        if req.path.match?(/items/)
            #/items/ is a REG EX! not "/items/". its items regex. 
            #and regex must u match. can't use include?...

            theitemname = req.path.split("/items/").last #ex: "/items/apples" will results in "apples"
            searchresult = @@items.find { |item| item.name == theitemname }
            

            if searchresult #truthy. something is found
                [200, {"Content-Type" => 'text/html'}, ["#{searchresult.price}"]]
                
            else
                [400, {"Content-Type" => 'text/html'}, ["Item not found"]]  
            end

            
        else
            [404, {"Content-Type" => 'text/html'}, ["Route not found"]]
        end

    end #end method

end
