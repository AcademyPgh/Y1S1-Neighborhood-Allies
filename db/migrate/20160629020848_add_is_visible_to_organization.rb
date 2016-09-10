class AddIsVisibleToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :is_visible, :boolean
    change_column_default :organizations, :is_visible, false
  end
end
