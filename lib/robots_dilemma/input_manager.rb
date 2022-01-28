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
      rescue Exception => e
        puts "Input Manager Error: #{e}"
      end
    end
  end
end
