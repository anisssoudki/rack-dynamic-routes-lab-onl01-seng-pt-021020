class Application
 @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/songs/)
 
      cart = req.path.split("/cart/").last
      items = @@items.find{|s| s.price == cart}
 
      resp.write cart.item
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end