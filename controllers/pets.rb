# pets controller

# add pet------------------------------------------------------
get "/add_pet/:x" do
  @owner = Owner.find(params["x"])
  erb :"add_pet"
end

get "/save_pet" do
  @pet = Pet.new({"name" => params["name"], "owner_id" => params["owner_id"]})
  if @pet.name_valid(params["name"]) 
    @pet.add_to_database
    erb :"add_pet_success"
  else
    @error = true
    erb :"add_pet"
  end
end
#TODO Bug right here, not sending to error. Something about

# edit pet -------------------------------------------------
get "/edit_pet/:x" do
  @pet = Pet.find(params["x"])
  erb :"edit_pet"
end
get "/save_pet_name" do
  @pet = Pet.find(params["id"])
  # both name_valid and email_valid must return true before saving to object and database.
  if @pet.name_valid(params["name"])
    @pet.save
    erb :"edit_pet_success"
  else
    @error = true
    erb :"edit_pet"
  end
end

# delete pet -------------------------------------------------
get "/delete_pet/:x" do
  @pet = Pet.find(params["x"])
  erb :"delete_pet"
end

get "/delete_pet_confirm" do
  @pet = Pet.find(params["id"])
  if params["decision"] == "yes"
    @pet.delete
    erb :"pet_deleted_success" # make erb for this.
  else
    erb :"pet_deleted_fail"
  end
end