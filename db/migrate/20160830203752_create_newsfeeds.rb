class CreateNewsfeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :newsfeeds do |t|
      t.text :message
      
      t.timestamps
    end
  end
end
