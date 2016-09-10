class UpdateFundAmount < ActiveRecord::Migration
  def change
    add_column :funding_sents, :amount, :integer 
  end
end
