module RobotsDilemma
  class Robot
    def initialize
      @position_x = 0
      @position_y = 0
      @facing = "NORTH"
    end

    def place(x, y, facing)
      #TODO: add validation
      @position_x = x
      @position_y = y
      @facing = facing
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

    def turn(direction)
      case direction
      when "RIGHT"
        case @facing
        when 'NORTH'
          @facing = "EAST"
        when 'SOUTH'
          @facing = "WEST"
        when 'EAST'
          @facing = "SOUTH"
        when 'WEST'
          @facing = "NORTH"
        else
          puts "the facing attrebute has a problem. #{@facing}"
        end
      when "LEFT"
        case @facing
        when 'NORTH'
          @facing = "WEST"
        when 'SOUTH'
          @facing = "EAST"
        when 'EAST'
          @facing = "NORTH"
        when 'WEST'
          @facing = "SOUTH"
        else
          puts "the facing attrebute has a problem. #{@facing}"
        end
      else
        puts "the facing attrebute has a problem. #{@facing}"
      end
    end

    def report
      puts "#{@position_x},#{@position_y},#{@facing}"
    end
  end
end