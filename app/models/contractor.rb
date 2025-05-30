class Contractor < User
  has_many :tasks, foreign_key: :contractor_id,dependent: :destroy
end
