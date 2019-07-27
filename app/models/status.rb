class Status < ActiveRecord::Base
  has_many :service_orders

end
