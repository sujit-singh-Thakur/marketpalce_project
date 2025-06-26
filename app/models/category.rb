class Category < ApplicationRecord
  has_many :tasks, dependent: :destroy
  validates :category_name, presence: true, uniqueness: { case_sensitive: false }
end
