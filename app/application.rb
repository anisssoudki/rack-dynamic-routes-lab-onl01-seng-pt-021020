class Application
 @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/songs/)
 
      cart = req.path.split("/cart/").last
      song = @@songs.find{|s| s.title == song_title}
 
      resp.write song.artist
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end