class CreateOrgStatusOthers < ActiveRecord::Migration
  def change
    create_table :org_status_others do |t|
      t.text :description
      t.references :organization

      t.timestamps null: false
    end
  end
end
