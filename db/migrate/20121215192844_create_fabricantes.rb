class CreateFabricantes < ActiveRecord::Migration
  def change
    create_table :fabricantes do |t|
      t.string :nombre
      t.integer :idPais

      t.timestamps
    end
  end
end
