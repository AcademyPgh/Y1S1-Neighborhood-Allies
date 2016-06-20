class CreateLogos < ActiveRecord::Migration
  def change
    create_table :logos do |t|
      t.blob :size

      t.timestamps null: false
    end
  end
end
