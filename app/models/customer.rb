  class Customer < ActiveRecord::Base
	validates :name, presence: true
	has_many :service_orders

	def list_of_customer
		"#{name.first}. #{surname}"
		
	end
	
end
