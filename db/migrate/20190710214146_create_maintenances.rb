class CreateMaintenances < ActiveRecord::Migration
  def change
    create_table :maintenances do |t|
      t.string :observations
      t.date :pending_date
      t.date :maintenance_date_made

      t.timestamps null: false
    end
  end
end
