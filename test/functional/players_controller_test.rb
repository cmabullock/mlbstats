require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
  setup do
    @player = players(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:players)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player" do
    assert_difference('Player.count') do
      post :create, player: { at_bats: @player.at_bats, games: @player.games, games_started: @player.games_started, given_name: @player.given_name, hit_by_pitch: @player.hit_by_pitch, hits: @player.hits, home_runs: @player.home_runs, rbi: @player.rbi, runs: @player.runs, sacrifice_flies: @player.sacrifice_flies, steals: @player.steals, surname: @player.surname, walks: @player.walks }
    end

    assert_redirected_to player_path(assigns(:player))
  end

  test "should show player" do
    get :show, id: @player
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player
    assert_response :success
  end

  test "should update player" do
    put :update, id: @player, player: { at_bats: @player.at_bats, games: @player.games, games_started: @player.games_started, given_name: @player.given_name, hit_by_pitch: @player.hit_by_pitch, hits: @player.hits, home_runs: @player.home_runs, rbi: @player.rbi, runs: @player.runs, sacrifice_flies: @player.sacrifice_flies, steals: @player.steals, surname: @player.surname, walks: @player.walks }
    assert_redirected_to player_path(assigns(:player))
  end

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete :destroy, id: @player
    end

    assert_redirected_to players_path
  end
end
