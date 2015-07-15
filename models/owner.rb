# require_relative "locationclass.rb"
# require_relative "categoryclass.rb"
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"
require_relative "pet.rb"
require_relative "category.rb"
require_relative "event.rb"


# Should Create a new owner.
# Should edit owner email.
# Should Delete an owner.
# Should Edit owner name.
# ALl of these methods are defined in database class and instance methods.

class Owner
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  attr_reader :id
  attr_accessor :name, :email, :password
 
  # Initializes a new Owner object.
  #
  # id (optional) - Integer of the primary key in the 'owners' table.
  #                         table.
  # name (optional)         - String of the owner's name.
  # email (optional)        - String of the owners's email.

  
  def initialize(owner_options={})
    @id = owner_options["id"]
    @name = owner_options["name"]
    @email = owner_options["email"]
    @password = owner_options["password"]
    
  end
  # save row to database. 
  def save
    CONNECTION.execute("UPDATE owners SET name = '#{self.name}', email = '#{self.email}' password = '#{self.password}' WHERE id = #{self.id};")
  end
  # instance method adds object attributes to database as a row.
  def add_to_database
    Owner.add({"name" => "#{self.name}", "email" => "#{self.email}", "password" => "#{self.password}"})
  end
  def self.find_email(login_email)
    result = CONNECTION.execute("SELECT * FROM owners WHERE email = '#{login_email}';")# .first
    if result.blank?
      return false
    # else
 #      Owner.new(result)
    end
  end
 

end