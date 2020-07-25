class WelcomeController < ApplicationController
  def index
    #lista de ordenes de servicios pendientes
  	@pending_services_orders = ServiceOrder.pending.page params[:page]
  	#lista de mantenimientos pendientes
    @pending_maintenances = Maintenance.pending.page params[:page]
  	#binding.pry
  end
end
