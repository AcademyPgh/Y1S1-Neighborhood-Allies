class CreatePAoSOthers < ActiveRecord::Migration
  def change
    create_table :p_ao_s_others do |t|
      t.text :description
      t.references :organization

      t.timestamps null: false
    end
  end
end
