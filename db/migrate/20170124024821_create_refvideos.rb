class CreateRefvideos < ActiveRecord::Migration[5.0]
  def change
    create_table :refvideos do |t|
      t.string :name
      t.string :url
      t.string :body
      t.timestamps
    end
  end
end
