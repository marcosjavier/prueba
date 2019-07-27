class AddReportedProblemToServiceOrder < ActiveRecord::Migration
  def change
    add_column :service_orders, :reported_problem, :string
  end
end
