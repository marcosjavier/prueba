class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :surname
      t.string :tradename
      t.string :address     

      t.timestamps
    end
  end
end
