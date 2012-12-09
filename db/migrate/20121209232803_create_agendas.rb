class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.string :nombre
      t.boolean :publica
      t.integer :idUsuario

      t.timestamps
    end
  end
end
