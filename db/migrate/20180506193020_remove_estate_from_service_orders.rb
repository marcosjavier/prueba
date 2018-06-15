class RemoveEstateFromServiceOrders < ActiveRecord::Migration
  def change
    remove_column :service_orders, :estate, :string
  end
end
