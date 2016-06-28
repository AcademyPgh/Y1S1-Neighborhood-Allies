class CreateFunders < ActiveRecord::Migration
  def change
    create_table :funders do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
