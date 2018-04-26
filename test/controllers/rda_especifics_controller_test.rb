require 'test_helper'

class RdaEspecificsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rda_especific = rda_especifics(:one)
  end

  test "should get index" do
    get rda_especifics_url
    assert_response :success
  end

  test "should get new" do
    get new_rda_especific_url
    assert_response :success
  end

  test "should create rda_especific" do
    assert_difference('RdaEspecific.count') do
      post rda_especifics_url, params: { rda_especific: { descripcion: @rda_especific.descripcion, rda_general_id: @rda_especific.rda_general_id } }
    end

    assert_redirected_to rda_especific_url(RdaEspecific.last)
  end

  test "should show rda_especific" do
    get rda_especific_url(@rda_especific)
    assert_response :success
  end

  test "should get edit" do
    get edit_rda_especific_url(@rda_especific)
    assert_response :success
  end

  test "should update rda_especific" do
    patch rda_especific_url(@rda_especific), params: { rda_especific: { descripcion: @rda_especific.descripcion, rda_general_id: @rda_especific.rda_general_id } }
    assert_redirected_to rda_especific_url(@rda_especific)
  end

  test "should destroy rda_especific" do
    assert_difference('RdaEspecific.count', -1) do
      delete rda_especific_url(@rda_especific)
    end

    assert_redirected_to rda_especifics_url
  end
end
