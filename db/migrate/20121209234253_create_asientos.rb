class CreateAsientos < ActiveRecord::Migration
  def change
    create_table :asientos do |t|
      t.integer :idViaje
      t.integer :idUsuario

      t.timestamps
    end
  end
end
