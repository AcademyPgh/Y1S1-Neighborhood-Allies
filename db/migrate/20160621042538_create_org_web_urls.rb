class CreateOrgWebUrls < ActiveRecord::Migration
  def change
    create_table :org_web_urls do |t|
      t.string :type
      t.string :url

      t.timestamps null: false
    end
  end
end
