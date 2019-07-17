class AddCustomerRefToMaintenances < ActiveRecord::Migration
  def change
    add_reference :maintenances, :customer, index: true
    add_foreign_key :maintenances, :customers
  end
end
