class AddLatitudeToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :latitude, :string
  end
end
