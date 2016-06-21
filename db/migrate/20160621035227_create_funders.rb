class CreateFunders < ActiveRecord::Migration
  has_many :fundcata
  def change
    create_table :funders do |t|
      t.string :name
    
      t.timestamps null: false
    end
  end
end
