class AddShortDescriptionToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :short_description, :string, null: false
  end
end
