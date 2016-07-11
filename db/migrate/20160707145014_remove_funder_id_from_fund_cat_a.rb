class RemoveFunderIdFromFundCatA < ActiveRecord::Migration
  def change
    remove_column :fund_cat_as, :funder_id, :integer
  end
end
