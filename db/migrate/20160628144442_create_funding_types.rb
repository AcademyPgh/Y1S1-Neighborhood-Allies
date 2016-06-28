class CreateFundingTypes < ActiveRecord::Migration
  def change
    create_table :funding_types do |t|
      t.string :fundtype

      t.timestamps null: false
    end
  end
end
