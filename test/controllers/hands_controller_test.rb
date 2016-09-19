require 'test_helper'

class HandsControllerTest < ActionController::TestCase
  setup do
    @hand = hands(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hand" do
    assert_difference('Hand.count') do
      post :create, hand: { bid: @hand.bid, game_id: @hand.game_id, got: @hand.got, player_id: @hand.player_id, round_num: @hand.round_num }
    end

    assert_redirected_to hand_path(assigns(:hand))
  end

  test "should show hand" do
    get :show, id: @hand
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hand
    assert_response :success
  end

  test "should update hand" do
    patch :update, id: @hand, hand: { bid: @hand.bid, game_id: @hand.game_id, got: @hand.got, player_id: @hand.player_id, round_num: @hand.round_num }
    assert_redirected_to hand_path(assigns(:hand))
  end

  test "should destroy hand" do
    assert_difference('Hand.count', -1) do
      delete :destroy, id: @hand
    end

    assert_redirected_to hands_path
  end
end
