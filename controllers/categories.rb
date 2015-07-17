get "/see_categories" do
  erb :"categories/see_categories"
end

# add category------------------------------------------------------
get "/add_category" do
  erb :"categories/add_category"
end
get "/save_category" do
  @category = Category.new({"name" => params["name"]})
  @category.add_to_database
  erb :"categories/add_category_success"
end
# delete category -------------------------------------------------
get "/delete_category/:x" do
  @category = Category.find(params["x"])
  erb :"categories/delete_category"
end

get "/category_deleted" do
  @category = Category.find(params["id"])
  if params["decision"] == "yes"
    @category.delete
    "deleted." # make erb for this.
  else
    "not deleted." 
    # make erb for this.
    # erb :"delete_success"
  end
end

#/edit category --------------------------------------------------
get "/edit_categories/:x" do
  @category = Category.find(params["x"])
  erb :"categories/edit_category"
end
# edit form
# hidden field to pass id
  
get "/save_category_edit" do
  @category = Category.find(params["id"])
  @category.name = params["name"]
  # both name_valid and email_valid must return true before saving to object and database.
  @category.save
  erb :"categories/edit_category_success"
end

 

  