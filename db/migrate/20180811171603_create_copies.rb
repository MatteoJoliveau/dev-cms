class CreateCopies < ActiveRecord::Migration[5.2]
  def change
    create_table :copies do |t|
      t.string :name, null: false
      t.text :content

      t.timestamps
    end

    add_index :copies, :name, unique: true
    %w[About Contacts].each { |name| Copy.find_or_create_by! name: name }
  end
end
