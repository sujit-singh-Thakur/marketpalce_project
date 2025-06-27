class RemovePartNumberFromapplication < ActiveRecord::Migration[8.0]
  def change
    remove_column :applications, :contact_number, :integer

  end
end
