class CreateFundCatBs < ActiveRecord::Migration
  def change
    create_table :fund_cat_bs do |t|
      t.string :name
      t.references :fund_cat_a, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
