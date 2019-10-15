class Movement < ActiveRecord::Base
	belongs_to :service_order
	belongs_to :device
end
