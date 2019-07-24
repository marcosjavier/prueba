class WelcomeController < ApplicationController
  def index
  	@pending_services_orders = ServiceOrder.pending
  	@pending_maintenances = Maintenance.pending
  	#binding.pry
  end
end
