class Device < ActiveRecord::Base
	has_many :service_orders
	
	enum type_of_device: {
		pc: "pc",
		notebook: "notebook"
	}
end
