class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    # validate :only_one_admin_allowed, if: -> { type == 'Admin' }

  validates :email, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  #  private

  # def only_one_admin_allowed
  #   if User.where(type: 'Admin').exists?
  #     errors.add(:type, 'Admin account already exists. You are not allowed to register as Admin.')
  #   end
  # end
end
