class CreateBudget < ActiveRecord::Migration
  def change
    create_table :budget do |t|
      t.string :budgetrange

      t.timestamps null: false
    end
  end
end
