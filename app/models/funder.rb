class Funder < ActiveRecord::Base
    belongs_to :organization
    has_many :fundcata
end
