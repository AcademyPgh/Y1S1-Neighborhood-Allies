class CreateFundCatAs < ActiveRecord::Migration
  def change
    create_table :fund_cat_as do |t|
      t.string :name
      t.references :funder, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
