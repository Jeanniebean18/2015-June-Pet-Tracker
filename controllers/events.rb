# events controller

# add event------------------------------------------------------
get "/create_event/:x/:y" do
  @category = Category.find(params["x"])
  @owner = Owner.find(params["y"])
  erb :"create_event"
end

get "save_event" do
  @event = Event.new({"name" => params["name"], "date" => params["date"], "category_id" => params["category_id"], "reminder_time" => params["reminder_time"], "comment" => params["comment"]})
  @event.add_to_database
  params["pets"].each do |pet|
    @pet = Pet.find(pet)
    @pet_event = PetEvent.new(@pet.id, @event.id )
    @pet_event.add_to_database
  end
      erb :"save_event_success"
end

# edit event -------------------------------------------------


# delete event -------------------------------------------------
