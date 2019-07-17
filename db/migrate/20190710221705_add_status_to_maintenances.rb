class AddStatusToMaintenances < ActiveRecord::Migration
  def change
    add_column :maintenances, :status, :string
  end
end
