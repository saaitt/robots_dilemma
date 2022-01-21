require 'minitest/autorun'

require_relative "../lib/robots_dilemma/robot"
require_relative "../lib/robots_dilemma/board"
require_relative "../lib/robots_dilemma/input_manager"

class InputManagerTest < Minitest::Test
  def test_place_input_successful
    input_manager = RobotsDilemma::InputManager.new
    $robot = RobotsDilemma::Robot.new
    $board = RobotsDilemma::Board.new
    input_manager.process("PLACE 0,0,NORTH")
    assert_equal "0,0,NORTH", $robot.report, "robots report should show a string like '0,0,NORTH' "
  end

  def test_move_command_success
    input_manager = RobotsDilemma::InputManager.new
    $robot = RobotsDilemma::Robot.new
    $board = RobotsDilemma::Board.new
    input_manager.process("PLACE 0,0,NORTH")
    input_manager.process("MOVE")
    input_manager.process("MOVE")
    assert_equal "0,2,NORTH", $robot.report, "robots report should show a string like '0,2,NORTH' "
  end

  def test_turn_right_success
    input_manager = RobotsDilemma::InputManager.new
    $robot = RobotsDilemma::Robot.new
    $board = RobotsDilemma::Board.new
    input_manager.process("PLACE 0,0,NORTH")
    input_manager.process("RIGHT")

    assert_equal "0,0,EAST", $robot.report, "robots report should show a string like '0,0,EAST' "
  end

  def test_turn_left_success
    input_manager = RobotsDilemma::InputManager.new
    $robot = RobotsDilemma::Robot.new
    $board = RobotsDilemma::Board.new
    input_manager.process("PLACE 0,0,NORTH")
    input_manager.process("LEFT")
    assert_equal "0,0,WEST", $robot.report, "robots report should show a string like '0,0,WEST' "
  end

  def test_edge_case
    board_width = ENV['BOARD_WIDTH'].nil? ? 5 : ENV['BOARD_WIDTH'].to_i
    board_height = ENV['BOARD_HEIGHT'].nil? ? 5 : ENV['BOARD_HEIGHT'].to_i
    input_manager = RobotsDilemma::InputManager.new
    $robot = RobotsDilemma::Robot.new
    $board = RobotsDilemma::Board.new
    input_manager.process("PLACE 0,0,NORTH")
    input_manager.process("MOVE")
    input_manager.process("RIGHT")
    (0..board_width + 3).each do
      input_manager.process("MOVE")
    end
    input_manager.process("LEFT")
    (0..board_height + 3).each do
      input_manager.process("MOVE")
    end
    input_manager.process("LEFT")
    (0..board_width + 3).each do
      input_manager.process("MOVE")
    end
    input_manager.process("LEFT")
    (0..board_height + 3).each do
      input_manager.process("MOVE")
    end
    input_manager.process("REPORT")

    assert_equal "0,0,SOUTH", $robot.report, "robots report should show a string like '0,0,SOUTH' "
  end
end

