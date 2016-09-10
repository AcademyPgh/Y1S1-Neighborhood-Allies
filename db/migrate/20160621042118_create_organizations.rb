class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :descrip
      t.text :mission
      t.text :address
      t.references :funder
      t.references :logo, index: true, foreign_key: true
      t.references :p_ao_s, index: true, foreign_key: true
      t.references :budget, index: true, foreign_key: true
      t.references :staffsize, index: true, foreign_key: true
      t.references :org_status, index: true, foreign_key:true
      t.timestamps null: false
    end
  end
end
