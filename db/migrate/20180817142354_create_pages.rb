# frozen_string_literal: true

class CreatePages < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.string :name, null: false
      t.string :path, null: false
      t.text :content

      t.timestamps
    end

    add_index :pages, :name
    add_index :pages, :path, unique: true
  end
end
