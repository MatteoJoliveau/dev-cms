class AddNavbarToPages < ActiveRecord::Migration[5.2]
  def change
    add_column :pages, :navbar, :boolean, default: false
    add_column :pages, :navbar_order, :integer, default: 0
  end
end
