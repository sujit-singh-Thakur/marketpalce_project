class Worker < User
  has_many :application
  scope :search, ->(query) {
    where("title ILIKE :q OR body ILIKE :q", q: "%#{sanitize_sql_like(query)}%") if query.present?
  }
end
