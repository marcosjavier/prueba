class MaintenancesController < ApplicationController
	before_action :set_maintenance, only: [:show, :edit, :update]
	def index
		@maintenances = Maintenance.all
		
	end
	def new
		@maintenance = Maintenance.new
		
	end

	def show
		
	end

	def create
		@maintenance = Maintenance.new(maintenance_params)
		if @maintenance.save
			redirect_to maintenances_path
		else
			render new_maintenance_path(@maintenance)
		end
		
	end

	def edit
		
	end

	def update
		if @maintenance.update(maintenance_params)
			redirect_to maintenances_path			
		else
			render @maintenance
		end
		
	end

	def pending
		@maintenances = Maintenance.pending
		
	end

	private
		def maintenance_params
			params.require(:maintenance).permit(
				:observations,
				:pending_date,
				:maintenance_date_made,
				:status,
				:customer_id)
			
		end

		def set_maintenance
			@maintenance = Maintenance.find(params[:id])
			
		end

end
