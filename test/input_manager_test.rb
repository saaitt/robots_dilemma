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
    expected_result = {:x=>0, :y=>0, :facing=>"NORTH"}
    assert_equal expected_result, $robot.report, "robots report should show a string like {:x=>0, :y=>0, :facing=>'NORTH'}"
  end

  def test_move_command_success
    input_manager = RobotsDilemma::InputManager.new
    $robot = RobotsDilemma::Robot.new
    $board = RobotsDilemma::Board.new
    input_manager.process("PLACE 0,0,NORTH")
    input_manager.process("MOVE")
    input_manager.process("MOVE")
    expected_result = {:x=>0, :y=>2, :facing=>"NORTH"}
    assert_equal expected_result, $robot.report, "robots report should return a hash like {:x=>0, :y=>2, :facing=>'NORTH'}"
  end

  def test_turn_right_success
    input_manager = RobotsDilemma::InputManager.new
    $robot = RobotsDilemma::Robot.new
    $board = RobotsDilemma::Board.new
    input_manager.process("PLACE 0,0,NORTH")
    input_manager.process("RIGHT")

    expected_result = {:x=>0, :y=>0, :facing=>"EAST"}
    assert_equal expected_result, $robot.report, "robots report should return a hash like {:x=>0, :y=>0, :facing=>'EAST'}"

  end

  def test_turn_left_success
    input_manager = RobotsDilemma::InputManager.new
    $robot = RobotsDilemma::Robot.new
    $board = RobotsDilemma::Board.new
    input_manager.process("PLACE 0,0,NORTH")
    input_manager.process("LEFT")
    expected_result = {:x=>0, :y=>0, :facing=>"WEST"}
    assert_equal expected_result, $robot.report, "robots report should return a hash like {:x=>0, :y=>0, :facing=>'WEST'}"
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

    expected_result = {:x=>0, :y=>0, :facing=>"SOUTH"}
    assert_equal expected_result, $robot.report, "robots report should return a hash like {:x=>0, :y=>0, :facing=>'SOUTH'}"

  end
end

