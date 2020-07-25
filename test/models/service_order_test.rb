require 'test_helper'

class ServiceOrderTest < ActiveSupport::TestCase
  
  # test "the truth" do
  #   assert true
  # end
  test "create and destroy service order" do
    service_order = ServiceOrder.new(
      last_move_date_at: service_orders(:two).last_move_date_at,
      customer: service_orders(:two).customer,
      reported_problem: service_orders(:two).reported_problem,
      status: service_orders(:two).status,
      cost_cents: service_orders(:two).cost_cents
      )
    assert service_order.save, service_order.errors.messages
    service_order_copy = ServiceOrder.find(service_order.id)
    assert_equal service_order.status , service_order_copy.status
    service_order.reported_problem = "probando problema"
    assert service_order.save, "no se puede guardar 2"
    assert service_order.destroy, "no se puede destruir"


  end

  test 'depending' do
     assert_equal ServiceOrder.pending.first, service_orders(:one), "la orden de servicio no está pendiente"
  end

end
