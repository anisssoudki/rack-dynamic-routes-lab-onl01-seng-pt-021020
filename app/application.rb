class Application
 @@items = []
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
 
      item_name = req.path.split("/items/").last
      name = @@items.find{|s| s.name == item_name}
        if name !=nil 
         resp.write name.price
        else
           resp.write "Route not found"
           resp.status = 404
         end
      else
        resp.write "Route not found"
        resp.status = 404
       end
    resp.finish
  end
end