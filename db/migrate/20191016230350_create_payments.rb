class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.monetize :amount
      t.string :description
      t.datetime :payed_at
      t.references :user, index: true
      t.references :service_order, index: true

      t.timestamps null: false
    end
    add_foreign_key :payments, :users
    add_foreign_key :payments, :service_orders
  end
end
