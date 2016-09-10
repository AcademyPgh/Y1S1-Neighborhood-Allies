class ChangeFundCatAName < ActiveRecord::Migration
  def change
    change_column :fund_cat_as, :name, :string, :default => "default"
  end
end
