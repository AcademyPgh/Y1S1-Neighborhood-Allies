class FundCatA < ActiveRecord::Base
    belongs_to :funder
    has_many :fundcatb
end
