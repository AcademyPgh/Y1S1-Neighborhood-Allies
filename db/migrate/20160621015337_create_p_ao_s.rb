class CreatePAoS < ActiveRecord::Migration
  def change
    create_table :p_ao_s do |t|
      t.string :area

      t.timestamps null: false
    end
  end
end
