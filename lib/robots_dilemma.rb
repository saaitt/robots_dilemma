require "tty-prompt"

require_relative "robots_dilemma/version"
require_relative "robots_dilemma/robot"
require_relative "robots_dilemma/board"
require_relative "robots_dilemma/input_manager"
require_relative "robots_dilemma/output_manager"

module RobotsDilemma
  class Error < StandardError; end

  at_exit do
    puts "Exiting"
  end

  prompt = TTY::Prompt.new
  $robot = RobotsDilemma::Robot.new
  $board = RobotsDilemma::Board.new
  input_manager = RobotsDilemma::InputManager.new
  output_manager = RobotsDilemma::OutputManager.new

  while true
    command = prompt.ask
    unless command.nil?
      begin
        result = input_manager.process(command)
        output_manager.print(result)
      rescue EXEPTION => e
        puts "Error on: #{e}"
      end
    end
  end

end
