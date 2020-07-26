class ServiceOrder < ActiveRecord::Base
	scope :pending, -> { where(status_id: 1)}
	scope :created_between, ->(date_start,date_end) { where(created_at: date_start..date_end) }
	scope :opened, -> { where("status_id = 1")}
	scope :closed, -> { where("status_id = 2")}

	before_create :set_fields
	belongs_to :customer
	belongs_to :status
	has_one :device
	has_many :movements
	has_many :payments
	accepts_nested_attributes_for :payments
	accepts_nested_attributes_for :movements, reject_if: :all_blank, allow_destroy: true
	monetize :cost_cents

	validates :customer_id, presence: { message: ' El campo del Cliente no puede estar en vacio' }
		
		
	def set_fields
		creation_date_at = Date.today

	end

	def get_last_date_of_movement
		if movements.present?
				movements.last.updated_at           
		end  
			
	end

	def get_status
		self.status.description
			
	end

		

	#def self.filter(date_start,date_end)
	#
	#  service_orders = ServiceOrder.where(created_at: date_start..date_end)

	#end

end
