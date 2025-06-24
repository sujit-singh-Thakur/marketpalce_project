class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :email, uniqueness: true
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    validates :contact , uniqueness:{message: "has already exist"}
    validates :contact, format: { with: /\A\+91\d{10}\z/, message: "must start with +91 " }
    
  end
