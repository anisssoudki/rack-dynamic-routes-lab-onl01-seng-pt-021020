class Application
 @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/songs/)
 
      cart = req.path.split("/cart/").last
      price = @@items.find{|s| s.price == cart}
 
      resp.write item.price
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end