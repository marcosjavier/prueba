class ServiceOrder < ActiveRecord::Base
	scope :pending, -> { where(state_id: 2)}
	scope :created_between, ->(date_start,date_end) { where(created_at: date_start..date_end) }
    before_create :set_fields
	belongs_to :customer
	belongs_to :state
	

	validates :customer_id, presence: { message: ' El campo del Cliente no puede estar en vacio' }
	validates :state_id, presence: true




	
	def set_fields
		creation_date_at = Date.today

	end

  #def self.filter(date_start,date_end)
  #
  #  service_orders = ServiceOrder.where(created_at: date_start..date_end)

  #end

end
