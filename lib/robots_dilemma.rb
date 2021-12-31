require "tty-prompt"

require_relative "robots_dilemma/version"
require_relative "robots_dilemma/robot"
require_relative "robots_dilemma/board"
require_relative "robots_dilemma/operator"

module RobotsDilemma
  class Error < StandardError; end

  prompt = TTY::Prompt.new
  operator = RobotsDilemma::Operator.new

  while true
    command = prompt.ask
    unless command.nil?
      command_parts = command.split(" ")
      begin
        operator.send(command_parts[0].downcase,command_parts)
      rescue
        puts "an unexpected thing happened"
      end
    end
  end

end
