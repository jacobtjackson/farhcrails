class CreateContractPackages < ActiveRecord::Migration[5.0]
  def change
    create_table :contract_packages do |t|
      t.string :file
      t.timestamps
    end
  end
end
