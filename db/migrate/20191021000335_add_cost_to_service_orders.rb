class AddCostToServiceOrders < ActiveRecord::Migration
  def change
  	add_monetize :service_orders, :cost
  end
end
