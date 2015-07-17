# pets controller
# TODO still need to acknowledge a solution for apstrophe's.
# add pet------------------------------------------------------

get "/add_pet/:x" do
  @owner = Owner.find(params["x"])
  erb :"pets/add_pet"
end

get "/save_pet" do
  @pet = Pet.new({"name" => params["name"], "owner_id" => params["owner_id"]})
  @pet.add_to_database
  erb :"pets/add_pet_success"
end


# edit pet -------------------------------------------------
get "/edit_pet/:x" do
  @pet = Pet.find(params["x"])
  erb :"pets/edit_pet"
end
get "/save_pet_name" do
  @pet = Pet.find(params["id"])
  if @pet.name_valid(params["name"])
    @pet.save
    erb :"pets/edit_pet_success"
  else
    @error = true
    erb :"pets/edit_pet"
  end
end

# delete pet -------------------------------------------------
get "/delete_pet/:x" do
  @pet = Pet.find(params["x"])
  erb :"pets/delete_pet"
end

get "/delete_pet_confirm" do
  @pet = Pet.find(params["id"])
  if params["decision"] == "yes"
    @pet.delete
    erb :"pets/pet_deleted_success" # make erb for this.
  else
    erb :"pets/pet_deleted_fail"
  end
end