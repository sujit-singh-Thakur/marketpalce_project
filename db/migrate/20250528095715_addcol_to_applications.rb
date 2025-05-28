class AddcolToApplications < ActiveRecord::Migration[8.0]
  def change
    add_column :applications, :email, :string
    add_column :applications, :contact_number, :integer
    add_column :applications, :address, :string
  end
end
