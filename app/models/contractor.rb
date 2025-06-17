class Contractor < User
  has_many :tasks, foreign_key: :contractor_id, dependent: :destroy
  has_many :categories
end
