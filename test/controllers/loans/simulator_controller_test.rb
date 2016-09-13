require 'test_helper'

class Loans::SimulatorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get loans_simulator_index_url
    assert_response :success
  end

end
