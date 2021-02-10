require "test_helper"

class BodyOfWatersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @body_of_water = body_of_waters(:one)
  end

  test "should get index" do
    get body_of_waters_url
    assert_response :success
  end

  test "should get new" do
    get new_body_of_water_url
    assert_response :success
  end

  test "should create body_of_water" do
    assert_difference('BodyOfWater.count') do
      post body_of_waters_url, params: { body_of_water: { name: @body_of_water.name } }
    end

    assert_redirected_to body_of_water_url(BodyOfWater.last)
  end

  test "should show body_of_water" do
    get body_of_water_url(@body_of_water)
    assert_response :success
  end

  test "should get edit" do
    get edit_body_of_water_url(@body_of_water)
    assert_response :success
  end

  test "should update body_of_water" do
    patch body_of_water_url(@body_of_water), params: { body_of_water: { name: @body_of_water.name } }
    assert_redirected_to body_of_water_url(@body_of_water)
  end

  test "should destroy body_of_water" do
    assert_difference('BodyOfWater.count', -1) do
      delete body_of_water_url(@body_of_water)
    end

    assert_redirected_to body_of_waters_url
  end
end
