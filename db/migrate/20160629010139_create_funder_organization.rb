class CreateFunderOrganization < ActiveRecord::Migration
  def self.up
    create_table :funders_organizations do |t|
      t.integer :funder_id
      t.integer :organization_id
      
    end
    add_index :funders_organizations, :organization_id
    add_index :funders_organizations, :funder_id
    
    remove_column :funders, :organizations
  end
  
  def self.down
    add_column :funders, :organizations, :string
  end
end
