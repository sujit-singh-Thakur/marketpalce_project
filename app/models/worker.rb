class Worker < User
  has_many :application,foreign_key: :worker_id, dependent: :destroy
  
end
