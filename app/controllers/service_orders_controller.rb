class ServiceOrdersController < ApplicationController
  before_action :set_service_order, only: [:show, :destroy, :edit, :update]

  def index
    @service_orders = ServiceOrder.all
    @service_order = ServiceOrder.new
    @service_order_pending = ServiceOrder.pending
    
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: 'service_orders/report', pdf: 'report'}
    end
  end

  def show
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @service_order = ServiceOrder.new(created_at: Time.zone.today)
  end

  def create
    @service_order = ServiceOrder.create(service_order_params)
    #@service_order.save
    respond_to do |format|
      #format.html do
      #  redirect_to @service_order,
      #  notice: t('.a new service order has been created')
      #end
      format.js
      #format.json do
       # render json: @service_order,
       # status: :created,
        #location: @service_order
    end
    
    
  end

  def edit
    respond_to do |format|
      format.js
    end
  end
  def update
    @service_order.update(service_order_params)
    respond_to do |format|
      format.js
    end

  end

  def destroy
  	@service_order.destroy

  	redirect_to service_orders_path

  end
  def filter_by_date
    @service_orders = ServiceOrder.filter(params[:search][:date_start],params[:search][:date_end])
    #pry.binding
    respond_to do |format|
      format.js
    end
  end

  private

  	def service_order_params
  		params.require(:service_order).permit(
  		:created_at,
  		:last_move_date_at,
  		:state_id,
  		:customer_id,
      :date_start,
      :date_end)

  	end

    def set_service_order
      @service_order = ServiceOrder.find(params[:id])

    end


end
