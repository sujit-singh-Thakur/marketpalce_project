class AddContractorIdToCategories < ActiveRecord::Migration[8.0]
  def change
    add_column :categories, :contractor_id, :integer
  end
end
