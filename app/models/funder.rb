class Funder < ActiveRecord::Base
    belongs_to :organizations
    has_many :fund_cat_as
end
