class Device < ActiveRecord::Base
	belongs_to :service_order
	
	enum type_of_device: {
		router: "router",
		pc: "pc",
		notebook: "notebook"
	}
end
