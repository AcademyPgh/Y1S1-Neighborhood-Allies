class FundCatB < ActiveRecord::Base
    belongs_to :fund_cat_a
    has_many :fund_check_box
end
