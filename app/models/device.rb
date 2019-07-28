class Device < ActiveRecord::Base
	has_many :service_orders
	
	enum type_of_device: {
		router: "router",
		pc: "pc",
		notebook: "notebook"
	}
end
