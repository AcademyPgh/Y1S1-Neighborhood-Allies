class CreateFunders < ActiveRecord::Migration
  def change
    create_table :funders do |t|
      t.string :name, null: false
      t.references :fund_cat_a, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
