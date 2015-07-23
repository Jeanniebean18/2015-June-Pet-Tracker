# events controller

# add event------------------------------------------------------
get "/create_event/:x/:y" do
  @category = Category.find(params[:x])
  @owner = Owner.find(params[:y])
  erb :"events/create_event"
end

get "/save_event" do
  @event = Event.new({name: params["name"], date: params["date"], category_id: params["category_id"], reminder_time: params["reminder_time"], comment: params["comment"]})
  @category = Category.find(params[:category_id])
  @owner = Owner.find(params[:owner_id])
  @event.save
  @pet_ids = params["pets"]
  @pet_ids.each do |row|
  @pet = Pet.find(row.to_i)
  @event.pets << (@pet)
  end
  erb :"events/save_event_success"
end
# delete event from pet ------------------------------------------------------
get "/delete_event_bridge/:x/:y/:z" do
  
  @pet = Pet.find(params[:x])
  @event = Event.find(params[:y])
  @owner = Owner.find(params[:z])
  # @event.pets.destroy(@pet)
  # PetEvent.delete_where(params[:x], params[:y])
  erb :"events/delete_event_bridge"
end

# For admin purposes 
#V View all events ------------------------------------------------------
get "/event_details" do
  @petsandevents = Event.event_details
  erb :"events/event_details"
end
# For admin purposes 
#Choose event to delete ------------------------------------------------------
get "/show_events" do
  erb :"events/show_events"
end

get "/delete_event/:x" do
  @event = Event.find(params[:x])
  @event.delete
  "event deleted."
end
