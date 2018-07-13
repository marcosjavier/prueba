class CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
    respond_to do |format|
      format.js
      
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.new(customer_params)

    @customer.save
    respond_to do |format|
      format.js
      
    end
     
     # redirect_to @customer
    #else
    #  render 'new'
    #end
  end

  def edit
    @customer = Customer.find(params[:id])

  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
      
    #else
     # render 'edit'
    #end
    respond_to do |format|
      format.js
      
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
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
end