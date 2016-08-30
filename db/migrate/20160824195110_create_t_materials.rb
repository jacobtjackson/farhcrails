class CreateTMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :t_materials do |t|
      t.string :url
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
