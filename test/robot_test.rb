require 'minitest/autorun'

require_relative "../lib/robots_dilemma/robot"

class RobotTest < Minitest::Test
  def test_robot_can_move
    @robot = ::RobotsDilemma::Robot.new
    @robot.place(0,0,"NORTH")
    @robot.move
    assert_equal "0,1,NORTH", @robot.report, "robot.report should show a string like '0,1,NORTH' "
  end

  def test_robot_can_turn_right
    @robot = ::RobotsDilemma::Robot.new
    @robot.place(0,0,"NORTH")
    @robot.turn "RIGHT"
    assert_equal "0,0,EAST", @robot.report, "robot.report should show a string like '0,0,EAST' "
  end

  def test_robot_can_turn_left
    @robot = ::RobotsDilemma::Robot.new
    @robot.place(0,0,"NORTH")
    @robot.turn "LEFT"
    assert_equal "0,0,WEST", @robot.report, "robot.report should show a string like '0,0,WEST' "
  end

  def test_robot_cant_move_unless_placed
    @robot = ::RobotsDilemma::Robot.new
    @robot.move
    assert_equal nil, @robot.report, "robot.report should be nil "
  end
end

