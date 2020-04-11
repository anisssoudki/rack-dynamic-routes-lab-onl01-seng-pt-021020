class Application
 @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/songs/)
 
      cart = req.path.split("/cart/").last
      item = @@items.find{|s| s.title == cart}
 
      resp.write song.artist
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end