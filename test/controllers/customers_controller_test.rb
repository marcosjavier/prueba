require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    sign_in users(:one) 
    
  end

  test "should get customers" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get a customer" do
    @customer = customers(:one)
    get :show, id: @customer.id
    assert_response :success
  end
end
