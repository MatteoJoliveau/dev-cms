class AddPublishedToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :published, :boolean, default: false
  end
end
