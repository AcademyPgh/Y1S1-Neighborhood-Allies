class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :descrip
      t.text :mission
      t.text :address
      t.references :logo, index: true, foreign_key: true
      t.references :paos, index: true, foreign_key: true
      t.references :budget, index: true, foreign_key: true
      t.references :funder, index: true, foreign_key: true
      t.references :staffsize, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
