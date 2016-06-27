class Funder < ActiveRecord::Base
    has_and_belongs_to_many :organizations
    has_many :fund_cat_as
end
