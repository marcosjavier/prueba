class AddServiceOrderRefToDevices < ActiveRecord::Migration
  def change
    add_reference :devices, :service_order, index: true
    add_foreign_key :devices, :service_orders
  end
end
