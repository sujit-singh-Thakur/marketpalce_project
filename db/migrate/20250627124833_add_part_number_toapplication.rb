class AddPartNumberToapplication < ActiveRecord::Migration[8.0]
  def change
    add_column :applications, :contact_number, :string
  end
end
