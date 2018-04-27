require 'test_helper'

class MinimusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @minimu = minimus(:one)
  end

  test "should get index" do
    get minimus_url
    assert_response :success
  end

  test "should get new" do
    get new_minimu_url
    assert_response :success
  end

  test "should create minimu" do
    assert_difference('Minimu.count') do
      post minimus_url, params: { minimu: { long_url: @minimu.long_url, short_url: @minimu.short_url } }
    end

    assert_redirected_to minimu_url(Minimu.last)
  end

  test "should show minimu" do
    get minimu_url(@minimu)
    assert_response :success
  end

  test "should get edit" do
    get edit_minimu_url(@minimu)
    assert_response :success
  end

  test "should update minimu" do
    patch minimu_url(@minimu), params: { minimu: { long_url: @minimu.long_url, short_url: @minimu.short_url } }
    assert_redirected_to minimu_url(@minimu)
  end

  test "should destroy minimu" do
    assert_difference('Minimu.count', -1) do
      delete minimu_url(@minimu)
    end

    assert_redirected_to minimus_url
  end
end
