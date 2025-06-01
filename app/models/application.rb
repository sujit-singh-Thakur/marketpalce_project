class Application < ApplicationRecord
  belongs_to :worker, class_name: "User", optional: true
  belongs_to :task

  # enum status: { accepted: 1}

end
