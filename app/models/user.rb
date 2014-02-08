class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  has_many :created_events, class_name: "Event", inverse_of: :created_by, foreign_key: "created_by_user"
  has_many :event_responsibilities, class_name: "Event", inverse_of: :contact, foreign_key: "contact_user"

  validates :password, :password_confirmation, :first_name, :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
