class Task < ApplicationRecord
  belongs_to :category
  belongs_to :contractor, class_name: "User"
  has_many :applications,dependent: :destroy
 
end
