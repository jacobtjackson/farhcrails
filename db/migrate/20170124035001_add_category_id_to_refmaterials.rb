class AddCategoryIdToRefmaterials < ActiveRecord::Migration[5.0]
  def change
    add_column :refmaterials, :category_id, :integer
  end
end
