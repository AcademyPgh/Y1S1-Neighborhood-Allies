class CreateFundCatAs < ActiveRecord::Migration
  def change
    create_table :fund_cat_as do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
