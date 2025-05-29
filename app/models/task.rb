class Task < ApplicationRecord
  belongs_to :category
  belongs_to :contractor, class_name: "User"
  scope :search, ->(query) {
    if query.present?
      where("title ILIKE :q OR description ILIKE :q", q: "%#{sanitize_sql_like(query)}%")
    end
  }

  # scope :search_by_name, ->(query) {
  #   where("name ILIKE ?", "%#{query}%") if query.present?
  # }

  scope :filter_by_status, ->(status) {
    where(status: status) if status.present? && status != "all"
  }
end
