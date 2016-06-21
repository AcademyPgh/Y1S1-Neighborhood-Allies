class CreateOrgStatuses < ActiveRecord::Migration
  def change
    create_table :org_statuses do |t|
      t.string :orgStatus

      t.timestamps null: false
    end
  end
end
