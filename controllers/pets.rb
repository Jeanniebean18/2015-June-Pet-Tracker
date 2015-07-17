# pets controller
# TODO still need to acknowledge a solution for apstrophe's.
# add pet------------------------------------------------------

get "/add_pet/:x" do
  @owner = Owner.find(params[:x])
  erb :"pets/add_pet"
end

get "/save_pet" do
  @owner = Owner.find(params[:owner_id])
  @pet = @owner.pets.create({"name" => params["name"]})
  if @pet.valid?
    @pet.save
    erb :"pets/add_pet_success"
  else 
    @error = true
    erb :"pets/add_pet"
  end
end
# you ended here for the day.


# edit pet -------------------------------------------------
get "/edit_pet/:x" do
  @pet = Pet.find(params[:x])
  erb :"pets/edit_pet"
end

get "/save_pet_name" do
  @pet = Pet.find(params["id"])
  @pet.name = params["name"]
  #add name validation later.
  @pet.save
  erb :"pets/edit_pet_success"

end

# delete pet -------------------------------------------------
get "/delete_pet/:x" do
  @pet = Pet.find(params[:name])
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