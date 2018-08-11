class CreateConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :configs do |t|
      t.string :key, null: false
      t.string :value, null: false

      t.timestamps
    end

    add_index :configs, :key, unique: true
  end
end
