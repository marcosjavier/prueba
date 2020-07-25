class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy, :service_orders_list]

  
  def index
    if params[:search]
      name = params[:search][:name]
      @customers = Customer.search(name).order(:id).page params[:page] 
    elsif params[:term]
      name = params[:term]
      @customers = Customer.search_name(name)
      #binding.pry
    else
      @customers = Customer.all.order(:id).page params[:page]
    end

    respond_to do |format|
      format.html
      format.json { render json: @customers}
    end
    
  end

  def new
    @customer = Customer.new
    
  end

  def show
    respond_to do |format|
      format.html
      format.js
      format.json { render json: @customer}
    end
   end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to customers_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    @customer.update(customer_params)
    respond_to do |format|
      format.js

    end
  end

  def destroy
    @customer.destroy
    redirect_to customers_path
  end

  def service_orders_list
    @service_orders = @customer.service_orders
    #binding.pry
    respond_to do |format|
      format.js
    end
    
    
  end

  private
    def customer_params
      params.require(:customer).permit(
        :name,
        :surname,
        :tradename,
        :address,
        :phone,
      )

    end

    def set_customer
      @customer = Customer.find(params[:id])
    end
end