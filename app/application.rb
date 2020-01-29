require_relative 'item.rb'
require 'pry'

class Application
  @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      # if @@items.any? {|i| i.name == req.path.split("/").last}
      match = @@items.find{|i| i.name == req.path.split("/").last}
      if match
        resp.write "Price: #{match.price}\n"
      else
        resp.status = 400
        resp.write "Item not found\n"
      end
    else
      resp.status = 404
      resp.write "Route not found\n"
    end

    resp.finish
  end
end
