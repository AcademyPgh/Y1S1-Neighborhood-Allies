class FundCatA < ActiveRecord::Base
    belongs_to :organization
    has_many :fund_cat_bs
end
