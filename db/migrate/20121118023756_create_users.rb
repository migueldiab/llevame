class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :email
      t.string :password
      t.string :salt
      t.date :dob
      t.integer :rep

      t.timestamps
    end
  end
end
