class AddLongitudeToOrganization < ActiveRecord::Migration
  def change
    add_column :organizations, :longitude, :string
  end
end
