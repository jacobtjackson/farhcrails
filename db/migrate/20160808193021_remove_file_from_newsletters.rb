class RemoveFileFromNewsletters < ActiveRecord::Migration[5.0]
  def change
    remove_column :newsletters, :file, :string
    add_column :newsletters, :newsletter, :string
  end
end
