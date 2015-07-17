class Owner < ActiveRecord::Base
  has_many :pets
  has_many :events
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end