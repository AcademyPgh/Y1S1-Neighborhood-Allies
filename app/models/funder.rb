class Funder < ActiveRecord::Base    
    has_many :organization
    has_many :fund_cat_as
end
