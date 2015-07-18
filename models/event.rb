
class Event < ActiveRecord::Base
  has_and_belongs_to_many :pets
  belongs_to :categories
  validates :name, presence: true
  
 
 
  # Takes date of event and reminder_time chosen by user.
  # increments date to reminder_time
  # Returns incremented date.
  def increment_date(date, reminder_time)
    @formatted_date = date.gsub(/-/, ', ').to_i
    new_date = Date.new(@formatted_date)
    new_date.advance(days: reminder_time) # => Wed, 04 Aug 2010
  end
end