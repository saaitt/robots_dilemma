require 'minitest/autorun'

require_relative "../lib/robots_dilemma/robot"
require_relative "../lib/robots_dilemma/board"

class RobotTest < Minitest::Test
  def test_robot_can_move
    $board = RobotsDilemma::Board.new
    @robot = ::RobotsDilemma::Robot.new
    @robot.place(["PLACE", "0,0,NORTH"])
    @robot.move
    result = @robot.report
    assert_equal "0,1,NORTH", "#{result[:x]},#{result[:y]},#{result[:facing]}", "robot.report should show a string like '0,1,NORTH' "
  end

  def test_robot_can_turn_right
    $board = RobotsDilemma::Board.new
    @robot = ::RobotsDilemma::Robot.new
    @robot.place(["PLACE", "0,0,NORTH"])
    @robot.right
    result = @robot.report
    assert_equal "0,0,EAST", "#{result[:x]},#{result[:y]},#{result[:facing]}", "robot.report should show a string like '0,0,EAST' "
  end

  def test_robot_can_turn_left
    $board = RobotsDilemma::Board.new
    @robot = ::RobotsDilemma::Robot.new
    @robot.place(["PLACE", "0,0,NORTH"])
    @robot.left
    result = @robot.report
    assert_equal "0,0,WEST", "#{result[:x]},#{result[:y]},#{result[:facing]}", "robot.report should show a string like '0,0,WEST' "
  end

  def test_robot_cant_move_unless_placed
    @robot = ::RobotsDilemma::Robot.new
    @robot.move
    assert_nil  @robot.report, "robot.report should be nil "
  end
end

