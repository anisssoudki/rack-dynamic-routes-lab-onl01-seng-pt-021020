class Application
 @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path=="/cart"
      resp.write "You requested the cart"
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end