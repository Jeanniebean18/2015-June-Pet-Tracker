get "/see_categories" do
  erb :"categories/see_categories"
end

# add category------------------------------------------------------
get "/add_category" do
  erb :"categories/add_category"
end
get "/save_category" do
  @category = Category.new({"name" => params[:name]})
  if @category.valid? 
    @category.save
    erb :"categories/add_category_success"
  else
    @error = true
    erb :"categories/add_category"
  end
end
  
# delete category -------------------------------------------------
get "/delete_category/:x" do
  @category = Category.find(params[:x])
  erb :"categories/delete_category"
end

get "/category_deleted" do
  @category = Category.find(params[:id])
  if params[:decision] == "yes"
    @category.destroy
    "deleted." # make erb for this.
  else
    "not deleted." 
    # make erb for this.
    # erb :"delete_success"
  end
end

#/edit category --------------------------------------------------
get "/edit_categories/:x" do
  @category = Category.find(params[:x])
  erb :"categories/edit_category"
end
# edit form
# hidden field to pass id
  
get "/save_category_edit" do
  @category = Category.find(params[:id])
  @category.name = params[:name]
  if @category.valid? 
    @category.save
    erb :"categories/edit_category_success"
  else
    @error = true
    erb :"categories/edit_category"
  end
end


 

  