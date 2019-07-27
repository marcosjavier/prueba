  class Customer < ActiveRecord::Base
	validates :name, presence: true, format: {with: /\A[a-zA-Z ]+\z/}
	validates :surname, presence: true, format: {with: /\A[a-zA-Z ]+\z/}
	#validates :tradename, presence: true, format: {with: /\A[a-zA-Z]+\z/}
	validates :phone, numericality: { only_integer: true }
	has_many :service_orders, dependent: :restrict_with_error
	has_many :maintenances
	geocoded_by :address
	
	
end
