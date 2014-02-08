class Event < ActiveRecord::Base
  belongs_to :location
  belongs_to :created_by, class_name: "User", foreign_key: "created_by_user"
  belongs_to :contact, class_name: "User", foreign_key: "contact_user"

  validates :title, :description, :created_by, :contact, presence: true
end
