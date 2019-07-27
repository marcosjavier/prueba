class ServiceOrder < ActiveRecord::Base
  scope :pending, -> { where(status_id: 1)}
	scope :created_between, ->(date_start,date_end) { where(created_at: date_start..date_end) }
  before_create :set_fields
	belongs_to :customer
	belongs_to :status
	belongs_to :device
	has_many :movements
	
	

	validates :customer_id, presence: { message: ' El campo del Cliente no puede estar en vacio' }
	
	
	def set_fields
		creation_date_at = Date.today

	end

  #def self.filter(date_start,date_end)
  #
  #  service_orders = ServiceOrder.where(created_at: date_start..date_end)

  #end

end
