class FundingSent < ActiveRecord::Base
  belongs_to :organization, :class_name => Organization
end
