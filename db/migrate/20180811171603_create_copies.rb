class CreateCopies < ActiveRecord::Migration[5.2]
  def change
    create_table :copies do |t|
      t.string :name, null: false
      t.text :content

      t.timestamps
    end

    add_index :copies, :name, unique: true
  end
end
