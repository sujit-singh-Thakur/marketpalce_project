class Task < ApplicationRecord
  belongs_to :category
  belongs_to :contractor, class_name: "User"
  has_many :applications, dependent: :destroy

  validates :description, :contact_info, presence: true
  validates :contact_info, format: { with: /\A\d{10}\z/, message: "number must be 10 digit " }
end
