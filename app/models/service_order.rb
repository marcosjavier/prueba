class ServiceOrder < ActiveRecord::Base
	before_create :set_fields
  
	belongs_to :customer
  belongs_to :state

  validates :customer_id, presence: { message: ' El campo del Cliente no puede estar en vacio' }
  validates :state_id, presence: true 



	private
	def set_fields
		self.creation_date_at = Date.today

	end
end
