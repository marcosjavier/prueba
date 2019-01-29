class ServiceOrder < ActiveRecord::Base
	before_create :set_fields
	belongs_to :customer
  belongs_to :state

  validates :customer_id, presence: { message: ' El campo del Cliente no puede estar en vacio' }
  validates :state_id, presence: true



	
	def set_fields
		creation_date_at = Date.today

	end

  def self.filter(date_start,date_end)
    service_orders = ServiceOrder.where(creation_date_at: date_start..date_end)

  end

end
