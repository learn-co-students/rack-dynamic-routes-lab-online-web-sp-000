class Application
  @@items = []

  def call(env)
    @resp = Rack::Response.new
    @req = Rack::Request.new(env)

    @item_names = @@items.map{|i| "/items/#{i.name}"}
    if @req.path.match(/items/)
      @item_name = @req.path.split("/items/").last
      if @item_names.include?(@req.path)
        item_price
      else
        error_no_item_found
      end
    else
      error_no_route_found
    end

    @resp.finish
  end

  def item_price
    @resp.write @@items.find{|i| i.name == @item_name}.price
  end

  def error_no_route_found
    @resp.status = 404
    @resp.write "Route not found"
  end

  def error_no_item_found
    @resp.status = 400
    @resp.write "Item not found"
  end
end
