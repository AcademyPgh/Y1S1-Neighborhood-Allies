class Funder < ActiveRecord::Base
    belongs_to_many :organizations
    has_many :fund_cat_as
end
