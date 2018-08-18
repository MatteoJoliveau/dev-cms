class AddNavbarToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :navbar, :boolean, default: false
  end
end
