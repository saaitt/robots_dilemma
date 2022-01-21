require "tty-prompt"

require_relative "robots_dilemma/version"
require_relative "robots_dilemma/robot"
require_relative "robots_dilemma/board"
require_relative "robots_dilemma/input_manager"

module RobotsDilemma
  class Error < StandardError; end

  prompt = TTY::Prompt.new
  $robot = RobotsDilemma::Robot.new
  $board = RobotsDilemma::Board.new
  input_manager = RobotsDilemma::InputManager.new

  while true
    command = prompt.ask
    unless command.nil?
      input_manager.process(command)
    end
  end

end
