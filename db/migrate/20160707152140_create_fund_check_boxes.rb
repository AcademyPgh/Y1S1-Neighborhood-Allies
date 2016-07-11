class CreateFundCheckBoxes < ActiveRecord::Migration
  def change
    create_table :fund_check_boxes do |t|
      t.integer :fund_cat_b_id
      t.string null: false, default: "default"

      t.timestamps null: false
    end
  end
end
