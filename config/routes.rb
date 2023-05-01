Rails.application.routes.draw do

  get("/users", { :controller => "users", :action => "index" })

  #name the controller after the table and in plural

  get("/users/:path_username", { :controller => "users", :action => "show" })

  get("/photos", { :controller => "photos", :action => "index" })

end
