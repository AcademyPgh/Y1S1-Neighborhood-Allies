class Organization < ActiveRecord::Base
  has_many :funder
  has_one :logo
  has_one :staff_sizes
  has_one :budget
end
