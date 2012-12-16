class CreateAuxilios < ActiveRecord::Migration
  def change
    create_table :auxilios do |t|
      t.string :nombre
      t.string :logo

      t.timestamps
    end
  end
end
