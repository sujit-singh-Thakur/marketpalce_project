class Application < ApplicationRecord
  belongs_to :worker, class_name: "User"
  belongs_to :task
  has_many :payments


  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :contact_number, format: { with: /\A\d{10}\z/, message: " must be 10 digit " }
  validates :contact_number, uniqueness: true
end
