class Organization < ActiveRecord::Base
  has_and_belongs_to_many :funders
  has_many :org_web_urls
  has_one :logo
  has_one :p_ao_s
  has_one :budget
  has_one :staff_size
  has_one :org_status
  has_many :funding_sents, :foreign_key => "organization_id_sent"
  has_many :funding_receives, :foreign_key => "organization_id_received"

  def as_json(option={})
    super(:only => [:name, :phone, :email, :descrip, :mission, :address,],
          :include => {
            :funders =>{:only => [:name]
            }
          }
      )
  end
end
