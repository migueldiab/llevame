class CreateSeguros < ActiveRecord::Migration
  def change
    create_table :seguros do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
