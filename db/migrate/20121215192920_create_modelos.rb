class CreateModelos < ActiveRecord::Migration
  def change
    create_table :modelos do |t|
      t.string :nombre
      t.integer :idFabricante

      t.timestamps
    end
  end
end
