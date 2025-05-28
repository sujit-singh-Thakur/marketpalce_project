class Application < ApplicationRecord
  belongs_to :task,optional: true
  belongs_to :workers,class_name: "User",optional: true
end
