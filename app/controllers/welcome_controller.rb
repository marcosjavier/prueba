class WelcomeController < ApplicationController
  def index
  	@pending_services_orders = ServiceOrder.pending.page params[:page]
  	@pending_maintenances = Maintenance.pending.page params[:page]
  	#binding.pry
  end
end
