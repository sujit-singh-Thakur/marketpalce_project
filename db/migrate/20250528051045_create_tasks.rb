class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.text :description
      t.string :contact_info
      t.references :category, null: false, foreign_key: true
      t.references :contractor, foreign_key: { to_table: :users }, index: true
      # null: false, foreign_key: true

      t.timestamps
    end
  end
end
