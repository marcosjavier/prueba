class RemoveCreationDateAtFromServiceOrders < ActiveRecord::Migration
  def change
    remove_column :service_orders, :creation_date_at, :date
  end
end
