class Payment < ActiveRecord::Base

  validates :payment_type, :payed_at, presence: true
	
  belongs_to :user
  belongs_to :service_order
  belongs_to :payment_type


  monetize :amount_cents
  monetize :balance_cents

  def update_balance(service_order)
  	balance = service_order.cost_cents - service_order.payments.sum(:amount_cents)
  	update_attribute(:balance_cents, balance)
  end

  #def self.find_first
  #	Payment.first

  	
  #end
end
