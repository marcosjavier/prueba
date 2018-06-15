class AddCustomerRefToServiceOrders < ActiveRecord::Migration
  def change
    add_reference :service_orders, :customer, index: true
  end
end
