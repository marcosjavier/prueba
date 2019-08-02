class DevicesController < ApplicationController
	before_action :set_device, only: [:show, :edit, :update, :destroy]
	before_action :set_service_order, only: [:new, :create]

	def index
    @devices = Device.all.order(:id).page params[:page]
  end

  def new
    @device = Device.new(service_order_id: @service_order.id)
    #binding.pry
    respond_to do |format|
      #format.html
      format.js
    end
  end

  def show
  	respond_to do |format|
  		format.js
  	end
  end

  def create
  	@device = Device.new(device_params)
  	@service_order.device = @device
  	#binding.pry
  	
  	if @device.save
  		redirect_to devices_path
  	else
  		render @device
  	end
  	
  end

  def edit
  	respond_to do |format|
      format.js
    end
  	
  end

  def update
  	@device.update(device_params)
  	respond_to do |format|
  		format.js
  	end
  end

  private
    def device_params
      params.require(:device).permit(
        :type_of_device,
        :observations,
        :admission_date,
        :discharge_date
      )

    end

    def set_device
      @device = Device.find(params[:id])
    end

    def set_service_order
    	@service_order = ServiceOrder.find(params[:service_order_id])
    	#binding.pry
    end

end
