class AddDeviceRefToServiceOrders < ActiveRecord::Migration
  def change
    add_reference :service_orders, :device, index: true
    add_foreign_key :service_orders, :devices
  end
end
