require "tty-prompt"

require_relative "robots_dilemma/version"
require_relative "robots_dilemma/robot"


module RobotsDilemma
  class Error < StandardError; end
  # Your code goes here...
  robot = RobotsDilemma::Robot.new
  robot.report
end
