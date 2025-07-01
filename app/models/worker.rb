class Worker < User
  has_many :applications, foreign_key: :worker_id, dependent: :destroy
  
end