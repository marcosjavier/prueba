class AddPaymentTypeRefToPayments < ActiveRecord::Migration
  def change
    add_reference :payments, :payment_type, index: true
    add_foreign_key :payments, :payment_types
  end
end
