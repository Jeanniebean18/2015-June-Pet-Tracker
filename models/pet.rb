
class Pet < ActiveRecord::Base
  has_and_belongs_to_many :events
  belongs_to :owners
end