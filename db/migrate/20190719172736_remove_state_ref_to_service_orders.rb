class RemoveStateRefToServiceOrders < ActiveRecord::Migration
  def change
    remove_reference :service_orders, :state, index: true
    remove_foreign_key :service_orders, :states
  end
end
