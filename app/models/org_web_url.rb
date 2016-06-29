class OrgWebUrl < ActiveRecord::Base
    belongs_to :organization
    has_one :social_type
end
