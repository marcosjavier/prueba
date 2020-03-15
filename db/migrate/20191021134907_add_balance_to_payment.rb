class AddBalanceToPayment < ActiveRecord::Migration
  def change
  	add_monetize :payments, :balance
  end
end
