class AddStatusRefToServiceOrders < ActiveRecord::Migration
  def change
    add_reference :service_orders, :status, index: true
    add_foreign_key :service_orders, :statuses
  end
end
