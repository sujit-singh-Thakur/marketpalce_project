class Application < ApplicationRecord
  belongs_to :worker, class_name: "User"
  belongs_to :task
  has_many :payments, dependent: :destroy
  has_one_attached :resume
  validate :resume_format

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :contact_number, format: { with: /\A(\+?\d{1,3})?\s?\d{10}\z/, message: " must be 10 digit " }
  validates :contact_number, uniqueness: true

  private
  def resume_format
    return unless resume.attached?

    unless resume.content_type.in?(%w[application/pdf application/png application/vnd.openxmlformats-officedocument.wordprocessingml.document])
      errors.add(:resume, "must be a PDF or Word document")
    end
  end
end
