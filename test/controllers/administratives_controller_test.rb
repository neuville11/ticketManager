require 'test_helper'

class AdministrativesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @administrative = administratives(:one)
  end

  test "should get index" do
    get administratives_url
    assert_response :success
  end

  test "should get new" do
    get new_administrative_url
    assert_response :success
  end

  test "should create administrative" do
    assert_difference('Administrative.count') do
      post administratives_url, params: { administrative: { cellphone: @administrative.cellphone } }
    end

    assert_redirected_to administrative_url(Administrative.last)
  end

  test "should show administrative" do
    get administrative_url(@administrative)
    assert_response :success
  end

  test "should get edit" do
    get edit_administrative_url(@administrative)
    assert_response :success
  end

  test "should update administrative" do
    patch administrative_url(@administrative), params: { administrative: { cellphone: @administrative.cellphone } }
    assert_redirected_to administrative_url(@administrative)
  end

  test "should destroy administrative" do
    assert_difference('Administrative.count', -1) do
      delete administrative_url(@administrative)
    end

    assert_redirected_to administratives_url
  end
end
