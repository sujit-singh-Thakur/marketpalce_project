class RemovePartNumberFromUsers < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :contact, :integer
  end
end
