class CreateSocialTypes < ActiveRecord::Migration
  def change
    create_table :social_types do |t|
      t.string :socType

      t.timestamps null: false
    end
  end
end
