require 'test_helper'

class CupomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cupom = cupoms(:one)
  end

  test "should get index" do
    get cupoms_url, as: :json
    assert_response :success
  end

  test "should create cupom" do
    assert_difference('Cupom.count') do
      post cupoms_url, params: { cupom: { name: @cupom.name, score: @cupom.score } }, as: :json
    end

    assert_response 201
  end

  test "should show cupom" do
    get cupom_url(@cupom), as: :json
    assert_response :success
  end

  test "should update cupom" do
    patch cupom_url(@cupom), params: { cupom: { name: @cupom.name, score: @cupom.score } }, as: :json
    assert_response 200
  end

  test "should destroy cupom" do
    assert_difference('Cupom.count', -1) do
      delete cupom_url(@cupom), as: :json
    end

    assert_response 204
  end
end
