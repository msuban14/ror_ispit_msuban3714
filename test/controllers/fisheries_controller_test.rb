require "test_helper"

class FisheriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @fishery = fisheries(:one)
  end

  test "should get index" do
    get fisheries_url
    assert_response :success
  end

  test "should get new" do
    get new_fishery_url
    assert_response :success
  end

  test "should create fishery" do
    assert_difference('Fishery.count') do
      post fisheries_url, params: { fishery: { description: @fishery.description, name: @fishery.name } }
    end

    assert_redirected_to fishery_url(Fishery.last)
  end

  test "should show fishery" do
    get fishery_url(@fishery)
    assert_response :success
  end

  test "should get edit" do
    get edit_fishery_url(@fishery)
    assert_response :success
  end

  test "should update fishery" do
    patch fishery_url(@fishery), params: { fishery: { description: @fishery.description, name: @fishery.name } }
    assert_redirected_to fishery_url(@fishery)
  end

  test "should destroy fishery" do
    assert_difference('Fishery.count', -1) do
      delete fishery_url(@fishery)
    end

    assert_redirected_to fisheries_url
  end
end
