class AddStateRefToServiceOrders < ActiveRecord::Migration
  def change
    add_reference :service_orders, :state, index: true
  end
end
