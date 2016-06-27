class CreateLogos < ActiveRecord::Migration
  def self.up
    create_table :logos do |t|
      t.binary :data, :null => false
      t.string :name, :null => false
      t.string :filename
      t.string :mime_type
      t.timestamps null: false
      t.references :organization, index: true, foreign_key: true
    end
  end
  
  def self.down
    drop_table :logos
  end
end
