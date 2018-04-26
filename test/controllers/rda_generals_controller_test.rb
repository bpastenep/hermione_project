require 'test_helper'

class RdaGeneralsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rda_general = rda_generals(:one)
  end

  test "should get index" do
    get rda_generals_url
    assert_response :success
  end

  test "should get new" do
    get new_rda_general_url
    assert_response :success
  end

  test "should create rda_general" do
    assert_difference('RdaGeneral.count') do
      post rda_generals_url, params: { rda_general: { : @rda_general., descripcion: @rda_general.descripcion } }
    end

    assert_redirected_to rda_general_url(RdaGeneral.last)
  end

  test "should show rda_general" do
    get rda_general_url(@rda_general)
    assert_response :success
  end

  test "should get edit" do
    get edit_rda_general_url(@rda_general)
    assert_response :success
  end

  test "should update rda_general" do
    patch rda_general_url(@rda_general), params: { rda_general: { : @rda_general., descripcion: @rda_general.descripcion } }
    assert_redirected_to rda_general_url(@rda_general)
  end

  test "should destroy rda_general" do
    assert_difference('RdaGeneral.count', -1) do
      delete rda_general_url(@rda_general)
    end

    assert_redirected_to rda_generals_url
  end
end
