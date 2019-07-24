class AddServiceOrderRefToMovements < ActiveRecord::Migration
  def change
    add_reference :movements, :service_order, index: true
    add_foreign_key :movements, :service_orders
  end
end
