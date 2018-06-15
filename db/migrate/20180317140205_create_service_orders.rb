class CreateServiceOrders < ActiveRecord::Migration
  def change
    create_table :service_orders do |t|
      t.date :creation_date_at
      t.date :last_move_date_at
      t.string :estate

      t.timestamps
    end
  end
end
