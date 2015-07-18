#
# CONNECTION.execute("DROP TABLE owners;")
# CONNECTION.execute("DROP TABLE pets;")
# CONNECTION.execute("DROP TABLE events;")
# CONNECTION.execute("DROP TABLE pet_events;")

unless ActiveRecord::Base.connection.table_exists?(:owners)
  ActiveRecord::Base.connection.create_table :owners do |t|
    t.string :name
    t.string :email
    t.string :password
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:pets)
  ActiveRecord::Base.connection.create_table :pets do |t|
    t.string :name
    t.integer :owner_id
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:events)
  ActiveRecord::Base.connection.create_table :events do |t|
    t.string :name
    t.string :date
    t.integer :category_id
    t.string :reminder_time
    t.string :comment
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:categories)
  ActiveRecord::Base.connection.create_table :categories do |t|
    t.string :name
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:events_pets)
  ActiveRecord::Base.connection.create_table :events_pets, id: false do |t|
    t.integer :event_id
    t.integer :pet_id
  end  
end