class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.string :url
      t.string :website
      t.text :description
      t.boolean :star, default: false

      t.timestamps
    end
  end
end
