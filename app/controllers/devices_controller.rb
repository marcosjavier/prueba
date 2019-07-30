class DevicesController < ApplicationController
	before_action :set_devise, only: [:show, :edit, :update, :destroy]

	def index
    @devices = Device.all.order(:id).page params[:page]
  end

  def new
    @device = Device.new
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
  	@device = Device.new(device_params)
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

    def set_devise
      @device = Device.find(params[:id])
    end

end
