module RobotsDilemma
  class InputManager
    def process(command_string)
      command_parts = command_string.split(" ")
      begin
        if command_parts[1].nil?
          result = $robot.public_send(command_parts[0].downcase)
        else
          result = $robot.public_send(command_parts[0].downcase,command_parts)
        end
      result
      rescue
        puts "an unexpected thing happened"
      end
    end
  end
end
