class Worker < User
  has_many :applications, foreign_key: :worker_id, dependent: :destroy

  # validates :contact,  format: { with: /\A\d{10}\z/, message: " must be 10 digit " }
  # validates :contact , uniqueness:{message: "has already exist"}
end
