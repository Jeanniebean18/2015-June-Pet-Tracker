get "/home" do
  erb :"user_menu", :layout => :"layout-admin"
end

# add owner------------------------------------------------------
get "/add_owner" do
  erb :"owners/add_owner"
end
get "/save_owner" do
  @owner = Owner.new({name: params["name"], email: params["email"], password: params["password"]})
  # add unique active record.
  if @owner.valid? 
    @owner.save
    erb :"owners/add_owner_success"
  else
    @error = true
    erb :"owners/add_owner"
  end
end
# login owner -------------------------------------------------
get "/login" do
  erb :"login"
end

get "/authorize" do
  @owner = Owner.where({email: params["email"]}).first
  if @owner.nil?
    @error = true
    erb :"login"
  else
    # 
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
  erb :"owners/delete_owner"
end

get "/delete_owner" do
  @owner = Owner.find(params["id"])
  if params["decision"] == "yes"
    #also, add javacript to hide that box.
    @owner.delete
    "deleted." # make erb for this.
  else
    "not deleted." # make erb for this.
    # erb :"delete_success"
  end
end
# select existing owner------------------------------------------
get "/existing_owner" do
  erb :"owners/existing_owner"
end

get "/see_profile/:x" do 
  if session[:user_id] && session[:user_id] == params[:x].to_i
    @owner = Owner.find(session[:user_id])
    erb :"owners/see_profile",:layout => :"ux_layout"
  else
    redirect "/login"
  end
end
#/edit profile --------------------------------------------------
get "/edit_profile/:x" do
  if session[:user_id] && session[:user_id] == params[:x].to_i
    @owner = Owner.find(session[:user_id])
    erb :"owners/edit_profile"
  else
    redirect "/login"
  end
end

get "/save_profile" do
  @owner = Owner.find(params["id"]) # this might be a little wierd...
  @owner.name = params["name"]
  @owner.email = params["email"]
  if @owner.valid?
  @owner.save
    erb :"owners/edit_profile_success"
  else
    @error = true
    erb :"owners/edit_profile"
  end
end

 

  