require "test_helper"

class FishWardensControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fish_warden = fish_wardens(:one)
  end

  test "should get index" do
    get fish_wardens_url
    assert_response :success
  end

  test "should get new" do
    get new_fish_warden_url
    assert_response :success
  end

  test "should create fish_warden" do
    assert_difference('FishWarden.count') do
      post fish_wardens_url, params: { fish_warden: { name: @fish_warden.name, phone: @fish_warden.phone } }
    end

    assert_redirected_to fish_warden_url(FishWarden.last)
  end

  test "should show fish_warden" do
    get fish_warden_url(@fish_warden)
    assert_response :success
  end

  test "should get edit" do
    get edit_fish_warden_url(@fish_warden)
    assert_response :success
  end

  test "should update fish_warden" do
    patch fish_warden_url(@fish_warden), params: { fish_warden: { name: @fish_warden.name, phone: @fish_warden.phone } }
    assert_redirected_to fish_warden_url(@fish_warden)
  end

  test "should destroy fish_warden" do
    assert_difference('FishWarden.count', -1) do
      delete fish_warden_url(@fish_warden)
    end

    assert_redirected_to fish_wardens_url
  end
end
