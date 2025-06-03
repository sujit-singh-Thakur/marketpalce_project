class Task < ApplicationRecord
  belongs_to :category
  belongs_to :contractor, class_name: "User",foreign_key: "contractor_id"
  has_many :applications,dependent: :destroy

  validates :description, :contact_info, presence: true
 
end
