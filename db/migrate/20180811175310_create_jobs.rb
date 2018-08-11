# frozen_string_literal: true

class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :company_name, null: false
      t.string :position, null: false
      t.text :description
      t.string :slug, null: false
      t.date :starting_date, null: false
      t.date :ending_date
      t.string :url

      t.timestamps
    end

    add_index :jobs, :slug, unique: true
    add_index :projects, :slug, unique: true
  end
end
