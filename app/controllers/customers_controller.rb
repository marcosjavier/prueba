class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
    respond_to do |format|
      format.js
    end
  end

  def show; end

  def create
    @customer = Customer.new(customer_params)

    @customer.save
    respond_to do |format|
      format.js
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