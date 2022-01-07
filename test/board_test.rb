require 'minitest/autorun'

require_relative "../lib/robots_dilemma/board"

class BoardTest < Minitest::Test
  def test_board_doesnt_allow_possition_outside
    board = ::RobotsDilemma::Board.new
    out_of_bounds_x = ENV['BOARD_WIDTH'].nil? ? 6 : ENV['BOARD_WIDTH'].to_i + 1
    out_of_bounds_y = ENV['BOARD_HEIGHT'].nil? ? 6 : ENV['BOARD_HEIGHT'].to_i + 1
    facing = "SOUTH"

    assert_equal false, board.check_positions([out_of_bounds_x, out_of_bounds_y, facing]), "board should return false "
  end

  def test_board_doesnt_allow_y_outside
    board = ::RobotsDilemma::Board.new
    valid_x = ENV['BOARD_WIDTH'].nil? ? 4 : ENV['BOARD_WIDTH'].to_i - 1
    out_of_bounds_y = ENV['BOARD_HEIGHT'].nil? ? 6 : ENV['BOARD_HEIGHT'].to_i + 1
    facing = "SOUTH"

    assert_equal false, board.check_positions([valid_x, out_of_bounds_y, facing]), "board should return false"
  end

  def test_board_doesnt_allow_x_outside
    board = ::RobotsDilemma::Board.new
    out_of_bounds_x = ENV['BOARD_WIDTH'].nil? ? 6 : ENV['BOARD_WIDTH'].to_i + 1
    valid_y = ENV['BOARD_HEIGHT'].nil? ? 4 : ENV['BOARD_HEIGHT'].to_i - 1
    facing = "SOUTH"

    assert_equal false, board.check_positions([out_of_bounds_x, valid_y, facing]), "board should return false"
  end

  def test_board_doesnt_allow_wrong_facing
    board = ::RobotsDilemma::Board.new
    valid_x = ENV['BOARD_WIDTH'].nil? ? 4 : ENV['BOARD_WIDTH'].to_i - 1
    valid_y = ENV['BOARD_HEIGHT'].nil? ? 4 : ENV['BOARD_HEIGHT'].to_i - 1
    invalid_facing = "soTb"

    assert_equal false, board.check_positions([valid_x, valid_y, invalid_facing]), "board should return false"
  end

  def test_board_allows_right_param
    board = ::RobotsDilemma::Board.new
    valid_x = ENV['BOARD_WIDTH'].nil? ? 4 : ENV['BOARD_WIDTH'].to_i - 1
    valid_y = ENV['BOARD_HEIGHT'].nil? ? 4 : ENV['BOARD_HEIGHT'].to_i - 1
    valid_facing = "WEST"

    assert_equal true, board.check_positions([valid_x, valid_y, valid_facing]), "board should return true"
  end
end

