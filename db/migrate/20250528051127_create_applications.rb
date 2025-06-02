class CreateApplications < ActiveRecord::Migration[8.0]
  def change
    create_table :applications do |t|
      t.references :task, null: false, foreign_key: true
      t.references :worker, foreign_key: { to_table: :users }, index: true
      t.string :status

      t.timestamps
    end
  end
end
