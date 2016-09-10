class AddNameToFundCheckBoxes < ActiveRecord::Migration
  def change
    add_column :fund_check_boxes, :name, :string, :default => "default"
  end
end
