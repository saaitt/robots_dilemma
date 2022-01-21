require 'minitest/autorun'

require_relative "../lib/robots_dilemma/board"

class BoardTest < Minitest::Test
  def test_board_doesnt_allow_possition_outside
    board = ::RobotsDilemma::Board.new
    out_of_bounds_x = ENV['BOARD_WIDTH'].nil? ? 6 : ENV['BOARD_WIDTH'].to_i + 1
    out_of_bounds_y = ENV['BOARD_HEIGHT'].nil? ? 6 : ENV['BOARD_HEIGHT'].to_i + 1
    facing = "SOUTH"

    assert_equal false, board.can_be_placed([out_of_bounds_x, out_of_bounds_y, facing]), "board should return false "
  end

  def test_board_doesnt_allow_y_outside
    board = ::RobotsDilemma::Board.new
    valid_x = ENV['BOARD_WIDTH'].nil? ? 4 : ENV['BOARD_WIDTH'].to_i - 1
    out_of_bounds_y = ENV['BOARD_HEIGHT'].nil? ? 6 : ENV['BOARD_HEIGHT'].to_i + 1
    facing = "SOUTH"

    assert_equal false, board.can_be_placed([valid_x, out_of_bounds_y, facing]), "board should return false"
  end

  def test_board_doesnt_allow_x_outside
    board = ::RobotsDilemma::Board.new
    out_of_bounds_x = ENV['BOARD_WIDTH'].nil? ? 6 : ENV['BOARD_WIDTH'].to_i + 1
    valid_y = ENV['BOARD_HEIGHT'].nil? ? 4 : ENV['BOARD_HEIGHT'].to_i - 1
    facing = "SOUTH"

    assert_equal false, board.can_be_placed([out_of_bounds_x, valid_y, facing]), "board should return false"
  end

  def test_board_doesnt_allow_wrong_facing
    board = ::RobotsDilemma::Board.new
    valid_x = ENV['BOARD_WIDTH'].nil? ? 4 : ENV['BOARD_WIDTH'].to_i - 1
    valid_y = ENV['BOARD_HEIGHT'].nil? ? 4 : ENV['BOARD_HEIGHT'].to_i - 1
    invalid_facing = "soTb"

    assert_equal false, board.can_be_placed([valid_x, valid_y, invalid_facing]), "board should return false"
  end

  def test_board_allows_right_param
    board = ::RobotsDilemma::Board.new
    valid_x = ENV['BOARD_WIDTH'].nil? ? 4 : ENV['BOARD_WIDTH'].to_i - 1
    valid_y = ENV['BOARD_HEIGHT'].nil? ? 4 : ENV['BOARD_HEIGHT'].to_i - 1
    valid_facing = "WEST"

    assert_equal true, board.can_be_placed([valid_x, valid_y, valid_facing]), "board should return true"
  end

  def test_board_doesnt_allow_moving_outside_north
    board = ::RobotsDilemma::Board.new
    valid_x = ENV['BOARD_WIDTH'].nil? ? 4 : ENV['BOARD_WIDTH'].to_i - 1
    border_y = ENV['BOARD_HEIGHT'].nil? ? 5 : ENV['BOARD_HEIGHT'].to_i
    valid_facing = "NORTH"

    assert_equal false, board.can_move([valid_x, border_y, valid_facing]), "board should return false"
  end

  def test_board_doesnt_allow_moving_outside_east
    board = ::RobotsDilemma::Board.new
    border_x = ENV['BOARD_WIDTH'].nil? ? 5 : ENV['BOARD_WIDTH'].to_i
    valid_y = ENV['BOARD_HEIGHT'].nil? ? 4 : ENV['BOARD_HEIGHT'].to_i - 1
    valid_facing = "EAST"

    assert_equal false, board.can_move([border_x, valid_y, valid_facing]), "board should return false"
  end

  def test_board_doesnt_allow_moving_outside_west
    board = ::RobotsDilemma::Board.new
    border_x = 0
    valid_y = ENV['BOARD_HEIGHT'].nil? ? 4 : ENV['BOARD_HEIGHT'].to_i - 1
    valid_facing = "WEST"

    assert_equal false, board.can_move([border_x, valid_y, valid_facing]), "board should return false"
  end

  def test_board_doesnt_allow_moving_outside_south
    board = ::RobotsDilemma::Board.new
    valid_x = ENV['BOARD_WIDTH'].nil? ? 4 : ENV['BOARD_WIDTH'].to_i - 1
    border_y = 0
    valid_facing = "SOUTH"

    assert_equal false, board.can_move([valid_x, border_y, valid_facing]), "board should return false"
  end

end

