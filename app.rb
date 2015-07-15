# Empower my program with SQLite.
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
# CONNECTION.execute("DROP TABLE owners;")
# CONNECTION.execute("DROP TABLE pets;")
# CONNECTION.execute("DROP TABLE events;")
# CONNECTION.execute("DROP TABLE pet_events;")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS owners (id INTEGER PRIMARY KEY, name TEXT, email TEXT, password TEXT);")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS pets (id INTEGER PRIMARY KEY, name TEXT, owner_id INTEGER);")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS events (id INTEGER PRIMARY KEY, name TEXT, date TEXT,
category_id INTEGER, reminder_time TEXT, comment TEXT);")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS categories (id INTEGER PRIMARY KEY, name TEXT);")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS pet_events (pet_id INTEGER, event_id INTEGER);")

# Get results as an Array of Hashes.
CONNECTION.results_as_hash = true



#___________________________________________________________________________________________________________

require_relative "controllers/owners.rb"
require_relative "controllers/pets.rb"
require_relative "controllers/categories.rb"
require_relative "controllers/events.rb"



#TODO's Add verify's on all fields.
# find a way to edit event, maybe keep pets involved the same. Seems legit.
# add in a gem
# send emails for notifications.



