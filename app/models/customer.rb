  class Customer < ActiveRecord::Base
	validates :name, presence: true, format: {with: /\A[a-zA-Z ]+\z/}
	validates :surname, presence: true, format: {with: /\A[a-zA-Z ]+\z/}
	#validates :tradename, presence: true, format: {with: /\A[a-zA-Z]+\z/}
	validates :phone, numericality: { only_integer: true }
	has_many :service_orders, dependent: :restrict_with_error
	has_many :maintenances
	geocoded_by :address

	def self.search(search_field)
		Customer.where("lower(name) LIKE ?", "%#{search_field.downcase}%")
		
	end

	def self.search_name(name_field)
		@customers = Customer.where("lower(name) LIKE ?", "%#{name_field.downcase}%")
		names = @customers.select(:name)
		names = names.map(&:name)
	end
			
	
	
	
	
end
