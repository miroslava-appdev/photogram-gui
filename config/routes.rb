Rails.application.routes.draw do
  # NOTE - name the controller after the table and in plural

  # homepage

  get("/", { :controller => "users", :action => "index" })

  # users

  get("/users", { :controller => "users", :action => "index" })

  get("/insert_user_record", { :controller => "users", :action => "create"})

  get("/users/:path_username", { :controller => "users", :action => "show" })

  get("/update_user/:modify_id", { :controller => "users", :action => "update"})

  # photos

  get("/photos", { :controller => "photos", :action => "index" })

  get("photos/:path_id", { :controller => "photos", :action => "show"})

  get("delete_photo/:toast_id", { :controller => "photos", :action => "bye" })

  get("/insert_photo", { :controller => "photos", :action => "create" })

  get("/insert_comment_record", :controller => "comments", :action => "create" )

  get("/update_photo/:modify_id", { :controller => "photos", :action => "update" })
end
