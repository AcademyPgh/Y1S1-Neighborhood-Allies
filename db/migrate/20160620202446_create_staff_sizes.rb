class CreateStaffSizes < ActiveRecord::Migration
  def change
    create_table :staff_sizes do |t|
      t.string :size

      t.timestamps null: false
    end
  end
end
