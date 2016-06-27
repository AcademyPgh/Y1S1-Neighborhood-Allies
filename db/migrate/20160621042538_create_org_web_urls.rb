class CreateOrgWebUrls < ActiveRecord::Migration
  def change
    create_table :org_web_urls do |t|
      t.string :type
      t.string :url
      t.references :organization, index: true, foreign_key: true
      t.references :social_type, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
