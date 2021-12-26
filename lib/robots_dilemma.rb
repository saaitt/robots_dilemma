require "tty-prompt"

require_relative "robots_dilemma/version"
require_relative "robots_dilemma/robot"

module RobotsDilemma
  class Error < StandardError; end

  prompt = TTY::Prompt.new
  robot = RobotsDilemma::Robot.new

  running = true
  while running
    command = prompt.ask
    #TODO encapsulate this part for testing and other forms of input
    command_parts = command.split(" ")
    case command_parts[0]
    when "PLACE"
      position = command_parts[1].split(',')
      robot.place(position[0].to_i, position[1].to_i, position[2])
    when "MOVE"
      robot.move
    when "RIGHT"
      robot.turn"RIGHT"
    when "LEFT"
      robot.turn"LEFT"
    when "REPORT"
      robot.report
    when "exit"
      running = false
    else
      puts 'invalid command'
    end
  end
end
