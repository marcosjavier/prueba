class Payment < ActiveRecord::Base
	
  belongs_to :user
  belongs_to :service_order


  monetize :amount_cents
end
