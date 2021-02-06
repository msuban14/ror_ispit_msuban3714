require "test_helper"

class FishingAreasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fishing_area = fishing_areas(:one)
  end

  test "should get index" do
    get fishing_areas_url
    assert_response :success
  end

  test "should get new" do
    get new_fishing_area_url
    assert_response :success
  end

  test "should create fishing_area" do
    assert_difference('FishingArea.count') do
      post fishing_areas_url, params: { fishing_area: { description: @fishing_area.description, name: @fishing_area.name, user: @fishing_area.user, views: @fishing_area.views } }
    end

    assert_redirected_to fishing_area_url(FishingArea.last)
  end

  test "should show fishing_area" do
    get fishing_area_url(@fishing_area)
    assert_response :success
  end

  test "should get edit" do
    get edit_fishing_area_url(@fishing_area)
    assert_response :success
  end

  test "should update fishing_area" do
    patch fishing_area_url(@fishing_area), params: { fishing_area: { description: @fishing_area.description, name: @fishing_area.name, user: @fishing_area.user, views: @fishing_area.views } }
    assert_redirected_to fishing_area_url(@fishing_area)
  end

  test "should destroy fishing_area" do
    assert_difference('FishingArea.count', -1) do
      delete fishing_area_url(@fishing_area)
    end

    assert_redirected_to fishing_areas_url
  end
end
