class CreateDepartamentos < ActiveRecord::Migration
  def change
    create_table :departamentos do |t|
      t.string :nombre
      t.integer :habitantes

      t.timestamps
    end
  end
end
