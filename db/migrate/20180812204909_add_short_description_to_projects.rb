class AddShortDescriptionToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :short_description, :string
    Project.find_each do |project|
      project.update_attributes! short_description: 'Default'
    end
    change_column_null :projects, :short_description, false
  end
end
