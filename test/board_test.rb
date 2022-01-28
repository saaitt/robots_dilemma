require 'minitest/autorun'

require_relative "../lib/robots_dilemma/board"

class BoardTest < Minitest::Test

  def test_board_doesnt_allow_y_outside
    board = ::RobotsDilemma::Board.new
    valid_x = ENV['BOARD_WIDTH'].nil? ? 4 : ENV['BOARD_WIDTH'].to_i - 1
    out_of_bounds_y = ENV['BOARD_HEIGHT'].nil? ? 6 : ENV['BOARD_HEIGHT'].to_i + 1
    facing = "SOUTH"

    assert_equal false, board.is_valid_position([valid_x, out_of_bounds_y]), "board should return false"
  end

  def test_board_doesnt_allow_x_outside
    board = ::RobotsDilemma::Board.new
    out_of_bounds_x = ENV['BOARD_WIDTH'].nil? ? 6 : ENV['BOARD_WIDTH'].to_i + 1
    valid_y = ENV['BOARD_HEIGHT'].nil? ? 4 : ENV['BOARD_HEIGHT'].to_i - 1
    facing = "SOUTH"

    assert_equal false, board.is_valid_position([out_of_bounds_x, valid_y]), "board should return false"
  end

end

