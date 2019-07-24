class MovementsController < ApplicationController
	before_action :set_movement, only: [:show, :edit, :update, :destroy]
	before_action :set_service_order, only: [:index, :show, :new, :create, :edit, :update, :destroy]

	def index
    @movements = @service_order.movements
  end

  def new
    @movement = Movement.new(service_order_id: @service_order.id)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
  	respond_to do |format|
  		format.js
  	end
  end

  def create
  	@movement = @service_order.movements.create(movement_params)
  	
  	
  	if @movement.save
  		redirect_to service_order_movements_path
  	else
  		render @movement
  	end
  	
  end

  def edit
  	respond_to do |format|
      format.js
    end
  	
  end

  def update
  	@movement.update(movement_params)
  	respond_to do |format|
  		format.js
  	end
  end

  private
    def movement_params
      params.require(:movement).permit(
        :work_done,
        :computer_supplies,
        :observations,
        :service_order_id

      )

    end

    def set_movement
      @movement = Movement.find(params[:id])
    end

    def set_service_order
    	@service_order = ServiceOrder.find(params[:service_order_id])
    	
    end


end
