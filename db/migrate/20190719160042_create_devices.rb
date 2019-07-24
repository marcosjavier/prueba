class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :type_of_device
      t.string :observations

      t.timestamps null: false
    end
  end
end
