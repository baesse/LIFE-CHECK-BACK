require 'test_helper'

class CheckAtividesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @check_ativide = check_ativides(:one)
  end

  test "should get index" do
    get check_ativides_url, as: :json
    assert_response :success
  end

  test "should create check_ativide" do
    assert_difference('CheckAtivide.count') do
      post check_ativides_url, params: { check_ativide: { body: @check_ativide.body, user_id: @check_ativide.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show check_ativide" do
    get check_ativide_url(@check_ativide), as: :json
    assert_response :success
  end

  test "should update check_ativide" do
    patch check_ativide_url(@check_ativide), params: { check_ativide: { body: @check_ativide.body, user_id: @check_ativide.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy check_ativide" do
    assert_difference('CheckAtivide.count', -1) do
      delete check_ativide_url(@check_ativide), as: :json
    end

    assert_response 204
  end
end
