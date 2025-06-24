class AddPartNumberToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :contact, :string
  end
end
