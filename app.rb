# Empower my program with SQLite.
require 'rubygems'
require 'bundler/setup'

require "sqlite3"
require "pry"
require "sinatra"
require "sinatra/reloader"



configure do
  enable :sessions
end
 

# Inventory tracking system for Fibers Home Store. 
# Empower my program with SQLite.
require "sqlite3"
require "active_support/inflector"
require "active_support/core_ext/array/conversions.rb"
require "active_support/core_ext/date/calculations.rb"
require 'active_support/core_ext/object/blank'

require_relative "models/owner.rb"
require_relative "models/pet.rb"
require_relative "models/category.rb"
require_relative "models/event.rb"
require_relative "models/petevent.rb"


# Load/create our database for this program in SQlite.
CONNECTION = SQLite3::Database.new("pet_tracker.db")

#___________________________________________________________________________________________________________

require_relative "controllers/owners.rb"
require_relative "controllers/pets.rb"
require_relative "controllers/categories.rb"
require_relative "controllers/events.rb"

# Database
require_relative "database_setup.rb"




#TODO's Add verify's on all fields.
# find a way to edit event, maybe keep pets involved the same. Seems legit.
# add in a gem
# send emails for notifications.
# encryption for passwords
# add sessions for all non-admin spots
# if session[:id] != (useradmin id, redirect to login home)



