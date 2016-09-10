class ChangeFundCatBName < ActiveRecord::Migration
  def change
     change_column :fund_cat_bs, :name, :string, :default => "default"
  end
end
