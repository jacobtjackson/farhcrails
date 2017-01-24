class CreateRefmaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :refmaterials do |t|
      t.string :file
      t.string :name
      t.string :body
      t.timestamps
    end
  end
end
