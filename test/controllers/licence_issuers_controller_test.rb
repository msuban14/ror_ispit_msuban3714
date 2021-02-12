require "test_helper"

class LicenceIssuersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @licence_issuer = licence_issuers(:one)
  end

  test "should get index" do
    get licence_issuers_url
    assert_response :success
  end

  test "should get new" do
    get new_licence_issuer_url
    assert_response :success
  end

  test "should create licence_issuer" do
    assert_difference('LicenceIssuer.count') do
      post licence_issuers_url, params: { licence_issuer: { name: @licence_issuer.name } }
    end

    assert_redirected_to licence_issuer_url(LicenceIssuer.last)
  end

  test "should show licence_issuer" do
    get licence_issuer_url(@licence_issuer)
    assert_response :success
  end

  test "should get edit" do
    get edit_licence_issuer_url(@licence_issuer)
    assert_response :success
  end

  test "should update licence_issuer" do
    patch licence_issuer_url(@licence_issuer), params: { licence_issuer: { name: @licence_issuer.name } }
    assert_redirected_to licence_issuer_url(@licence_issuer)
  end

  test "should destroy licence_issuer" do
    assert_difference('LicenceIssuer.count', -1) do
      delete licence_issuer_url(@licence_issuer)
    end

    assert_redirected_to licence_issuers_url
  end
end
