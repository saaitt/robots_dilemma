module RobotsDilemma
  class Robot
    def initialize
      @position_x = 0
      @position_y = 0
      @facing = "NORTH"
    end

    def move
      case @facing
      when 'NORTH' #TODO: check edge cases
        @position_y += 1
      when 'SOUTH'
        @position_y -= 1
      when 'EAST'
        @position_x += 1
      when 'WEST'
        @position_x -= 1
      else
        puts 'invalid input'
      end
    end

    def report
      puts "#{@position_x},#{@position_y},#{@facing}"
    end
  end
end