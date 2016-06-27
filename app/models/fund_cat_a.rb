class FundCatA < ActiveRecord::Base
    belongs_to :funder
    has_many :fund_cat_bs
end
