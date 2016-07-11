class CreateFundingSents < ActiveRecord::Migration
  def change
    create_table :funding_sents do |t|
      t.integer :organization_id_sent
      t.integer :organization_id_received
      t.references :funding_type_id

      t.timestamps null: false
    end
  end
end
