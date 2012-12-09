class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :idUsuario
      t.integer :idViaje
      t.integer :idAsiento
      t.string :asunto
      t.text :desc
      t.integer :puntaje

      t.timestamps
    end
  end
end
