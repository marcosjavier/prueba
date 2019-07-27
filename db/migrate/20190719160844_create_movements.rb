class CreateMovements < ActiveRecord::Migration
  def change
    create_table :movements do |t|
      t.string :work_done
      t.string :computer_supplies
      t.string :observations

      t.timestamps null: false
    end
  end
end
