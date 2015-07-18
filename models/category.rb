
# only admin access of categories
# add, edit and delete.

class Category < ActiveRecord::Base
  validates :name, presence: true
  has_many :events
end