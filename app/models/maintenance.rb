class Maintenance < ActiveRecord::Base
	enum status: {
	 pending: "pendiente",
	 finished: "finalizado"
	}

	belongs_to :customer

	scope :pending, -> { where(status: "pendiente")}


end
