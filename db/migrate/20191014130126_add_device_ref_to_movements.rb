class AddDeviceRefToMovements < ActiveRecord::Migration
  def change
    add_reference :movements, :device, index: true
    add_foreign_key :movements, :devices
  end
end
