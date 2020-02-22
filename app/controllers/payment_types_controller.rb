class PaymentTypesController < ApplicationController
	before_action :set_payment_type, only: [:new]

	def index
		@payment_types = PaymentType.all
	end

	def new
		
		
	end

	def create
		@payment_type = PaymentType.new(payment_type_params)
			
		 
		if @payment_type.save
			redirect_to payment_types_path
		else
			@payment_type
			
		end
		
	end

	private
		def payment_type_params
			params.require(:payment_type).permit(
				:description
				)

		end

		def set_payment_type
			@payment_type = PaymentType.new
			
		end
end
