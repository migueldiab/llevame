class UserVerifiedField < ActiveRecord::Migration
  def up
    add_column :users, :verified, :boolean

  end

  def down

  end
end
