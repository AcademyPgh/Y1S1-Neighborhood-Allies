class AddOrganizationIdToFundCatA < ActiveRecord::Migration
  def change
    add_column :fund_cat_as, :organization_id, :integer
  end
end
