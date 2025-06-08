class Application < ApplicationRecord
  belongs_to :worker, class_name: "User"
  belongs_to :task


  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }


end
