
require 'minitest/autorun'

require_relative "../lib/robots_dilemma/robot"
require_relative "../lib/robots_dilemma/board"
require_relative "../lib/robots_dilemma/operator"

class OperatorTest < Minitest::Test
  def test_operator_places_correctly
    operator = ::RobotsDilemma::Operator.new
    operator.place(["place", "0,0,NORTH"])
    assert_equal "0,0,NORTH", operator.report, "operator.report should show a string like '0,0,NORTH' "
  end

  def test_operator_moves_correctly
    operator = ::RobotsDilemma::Operator.new
    operator.place(["place", "0,0,NORTH"])
    operator.move
    operator.move
    assert_equal "0,2,NORTH", operator.report, "operator.report should show a string like '0,2,NORTH' "
  end

  def test_operator_turns_right_correctly
    operator = ::RobotsDilemma::Operator.new
    operator.place(["place", "0,0,NORTH"])
    operator.right
    assert_equal "0,0,EAST", operator.report, "operator.report should show a string like '0,0,EAST' "
  end

  def test_operator_turns_left_correctly
    operator = ::RobotsDilemma::Operator.new
    operator.place(["place", "0,0,NORTH"])
    operator.left
    assert_equal "0,0,WEST", operator.report, "operator.report should show a string like '0,0,WEST' "
  end

  def test_operator_doesnt_get_out_of_borders
    board_width = ENV['BOARD_WIDTH'].nil? ? 5 : ENV['BOARD_WIDTH'].to_i
    board_height = ENV['BOARD_HEIGHT'].nil? ? 5 : ENV['BOARD_HEIGHT'].to_i
    operator = ::RobotsDilemma::Operator.new
    operator.place(["place", "0,0,SOUTH"])
    operator.move
    operator.left
    (0..board_width + 3).each do
      operator.move
    end
    operator.left
    (0..board_height + 3).each do
      operator.move
    end
    operator.left
    (0..board_width + 3).each do
      operator.move
    end
    operator.left
    (0..board_height + 3).each do
      operator.move
    end
    assert_equal "0,0,SOUTH", operator.report, "operator.report should show a string like '0,0,SOUTH' "
  end
end

