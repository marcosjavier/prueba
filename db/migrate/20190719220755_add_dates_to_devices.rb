class AddDatesToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :admission_date, :date
    add_column :devices, :discharge_date, :date
  end
end
