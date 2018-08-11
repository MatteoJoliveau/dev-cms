class AddPublishedStatusToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :published, :boolean, default: false
  end
end
