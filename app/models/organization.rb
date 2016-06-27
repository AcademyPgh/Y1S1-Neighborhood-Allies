class Organization < ActiveRecord::Base
  has_many :funders
  has_many :org_web_urls
  has_one :logo
  has_one :p_ao_s
  has_one :budget
  has_one :staff_size
  has_one :org_status
end
