class CreateProgramas < ActiveRecord::Migration
  def change
    create_table :programas do |t|
      t.string :nombre
      t.integer :idAgenda
      t.date :fInicio
      t.date :fFin

      t.timestamps
    end
  end
end
