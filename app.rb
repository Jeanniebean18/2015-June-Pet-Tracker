# Empower my program with SQLite.
require 'rubygems'
require 'bundler/setup'

require "active_record"
require "pry"
require "sinatra"
require "sinatra/reloader"
require 'bcrypt'

configure do
  enable :sessions
end

configure :development do
   require "sqlite3"
  ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'pet_tracker.db')
end

configure :production do 
  require "pg" 
  db = URI.parse(ENV['DATABASE_URL'])

  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end

# Empower my program with SQLite.

require "active_support/inflector"
require "active_support/core_ext/array/conversions.rb"
require "active_support/core_ext/date/calculations.rb"
require 'active_support/core_ext/object/blank'

require_relative "models/owner.rb"
require_relative "models/pet.rb"
require_relative "models/category.rb"
require_relative "models/event.rb"
require_relative "models/petevent.rb"




# So that ActiveRecord explains the SQL it's running in the logs.
ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)

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



