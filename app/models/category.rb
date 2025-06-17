class Category < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :contractor
  validates :category_name, presence: true, uniqueness: { case_sensitive: false, message: "this category has alredy exist" }
end
