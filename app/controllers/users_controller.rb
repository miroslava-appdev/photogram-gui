class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({:username => :asc })
    render({ :template => "user_templates/index.html.erb" })
  end

  def show
    #parameters: {"path_username"=>"anisa"}
    url_username = params.fetch("path_username")
    matching_usernames = User.where({ :username => url_username })
    @the_user = matching_usernames.first
    
    render({ :template => "user_templates/show.html.erb" })

    #WHEN SENDING TO AN ERROR PAGE IF IT DOESNT MATCH, DO THE FOLLOWING: 
    #if @the_user == nil
    #  redirect_to("/404")
    #else 
    #render({ :template => "user_templates/show.html.erb" })
    #end
  end 

  def create
    input_new_username = params.fetch("Username")
    a_new_user = User.new
    a_new_user.username = input_new_username
    a_new_user.save
    # render({ :template => "user_templates/create.html.erb" })
    redirect_to("/users/" + a_new_user.username.to_s)
  end

  def update
    the_id = params.fetch("modify_id")
    matching_users = User.where({ :username => the_id })
    the_user = matching_users.at(0)

    input_new_username = params.fetch("input_username")

    the_user.username = input_new_username
    the_user.save

    redirect_to("/users/" + the_user.username.to_s)
  end
end
