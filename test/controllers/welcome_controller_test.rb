require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  
  def setup
    sign_in users(:one) 
  end
     
  test "should get index" do
    get :index
    assert_response :success
    assert :pending_maintenances
    assert :pending_services_orders
  end


end
