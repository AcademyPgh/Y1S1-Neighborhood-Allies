class FundingSent < ActiveRecord::Base
  belongs_to :organization_to, :class_name => Organization, :foreign_key => "organization_id_received"
  belongs_to :organization_from, :class_name => Organization, :foreign_key => "organization_id_sent"
end
