get "/home" do
  erb :"user_menu", :layout => :"layout-admin"
end

# add owner------------------------------------------------------
get "/add_owner" do
  erb :"add_owner"
end
get "/save_owner" do
  @owner = Owner.new({"name" => params["name"], "email" => params["email"], "password" => params["password"]})
  if @owner.name_valid(params["name"]) && @owner.email_valid(params["email"]) 
    @owner.add_to_database
    erb :"add_owner_success"
  else
    @error = true
    erb :"add_owner"
  end
end
# login owner -------------------------------------------------
get "/login" do
  erb :"login"
end

get "/authorize" do
  @owner = Owner.find_email(params["email"])
  if @owner == "nope"
    @error = true
    erb :"login"
  else
    if @owner.password == params["password"]
      session[:user_id] = @owner.id
      redirect "/see_profile/#{@owner.id}"
    else
      @error = true
      erb :"login"
    end
  end
end
# delete owner -------------------------------------------------
get "/delete_owner_form" do
  erb :"delete_owner"
end

get "/delete_owner" do
  @owner = Owner.find(params["id"])
  if params["decision"] == "yes"
    @owner.delete
    "deleted." # make erb for this.
  else
    "not deleted." # make erb for this.
    # erb :"delete_success"
  end
end
# select existing owner------------------------------------------
get "/existing_owner" do
  erb :"existing_owner"
end

get "/see_profile/:x" do 
  if session[:user_id] && session[:user_id] == params[:x].to_i
    @owner = Owner.find(session[:user_id])
    @petsandevents = Event.event_details
    erb :"see_profile",:layout => :"ux_layout"
  else
    redirect "/login"
  end
end
#/edit profile --------------------------------------------------
get "/edit_profile/:x" do
  if session[:user_id]
    @owner = Owner.find(session[:user_id])
    erb :"edit_profile"
  else
    redirect "/login"
  end
end

get "/save_profile" do
  @owner = Owner.find(params["id"])
  # both name_valid and email_valid must return true before saving to object and database.
  if @owner.name_valid(params["name"]) && @owner.email_valid(params["email"])
    @owner.save
    erb :"edit_profile_success"
  else
    @error = true
    erb :"edit_profile"
  end
end

 

  