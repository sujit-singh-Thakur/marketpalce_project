class Task < ApplicationRecord
  belongs_to :category
  belongs_to :contractor, class_name: "User"
  has_many :applications, dependent: :destroy

  validates :description, :contact_info, presence: true
  validates :contact_info, format: { with: /\A\+91\d{10}\z/, message: "must start with +91 " }

end
