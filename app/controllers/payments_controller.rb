class PaymentsController < ApplicationController
	#before_action :set_payment, only: :new

	def index
		if params[:service_order_id]
			@payments = Payment.where service_order_id: params[:service_order_id]
			respond_to do |format|
				format.js
			end
		else
			@payments = Payment.all
		end
		
	end

	def new
		@payment = Payment.new	
	end

	def create
		@payment = Payment.new(payment_params)
		@payment.user = current_user		
		#binding.pry
		#@payment.update_balance(@payment.amount, @payment.service_order)
		@payment.save		
		if @payment.save
			@service_order = @payment.service_order
			@payment.update_balance(@service_order)
			redirect_to payments_path
		else
			render 'new'
		end
		
	end

	private
	def set_payment
		@payment = Payment.find(params[:id])
		
	end
	def payment_params
		params.require(:payment).permit(
			:amount,
			:balance,
			:description,
			:payed_at,
			:service_order_id,
			:user_id
			)
		
	end
end
