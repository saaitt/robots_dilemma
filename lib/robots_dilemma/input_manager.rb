module RobotsDilemma
  class InputManager
    def process(command_string)
      command_parts = command_string.split(" ")
      begin
        if command_parts[1].nil?
          response = $operator.public_send(command_parts[0].downcase)
          unless response.nil?
            puts "output: #{response}"
          end
        else
          $operator.send(command_parts[0].downcase,command_parts)
        end
      rescue
        puts "an unexpected thing happened"
      end
    end
  end
end
