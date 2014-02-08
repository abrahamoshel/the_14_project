class Location < ActiveRecord::Base
  has_many :events

  validates :name, :addr1, :city, :state, :zip, presence: true
end
