class CreateLogos < ActiveRecord::Migration
  def change
    create_table :logos do |t|
      t.binary :image

      t.timestamps null: false
    end
  end
end
