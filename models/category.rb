# require_relative "locationclass.rb"
# require_relative "categoryclass.rb"
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"
require_relative "pet.rb"
require_relative "owner.rb"
require_relative "event.rb"
# only admin access of categories
# add, edit and delete.

class Category < ActiveRecord::Base
end