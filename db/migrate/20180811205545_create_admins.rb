# frozen_string_literal: true

class CreateAdmins < ActiveRecord::Migration[5.2]
  def change
    create_table :admins do |t|
      t.string :email, null: false
      t.string :encrypted_password, limit: 128, null: false
      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false

      t.timestamps
    end

    add_index :admins, :email, unique: true
    add_index :admins, :remember_token
  end
end
