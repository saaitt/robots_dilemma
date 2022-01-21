module RobotsDilemma
  class Robot
    def initialize
      @position_x = -1
      @position_y = -1
      @facing = "NORTH"
    end

    def place(x, y, facing)
      @position_x = x
      @position_y = y
      @facing = facing
    end

    def move
      if is_robot_placed
        move_robot_forward
      end
    end

    def turn(direction)
      if is_robot_placed
        case direction
        when "RIGHT"
          turn_robot_right
        when "LEFT"
          turn_robot_left
        else
          puts "the facing attribute has a problem. #{@facing}"
        end
      end
    end

    def report
      if is_robot_placed
        "#{@position_x},#{@position_y},#{@facing}"
      end
    end

    private

    def move_robot_forward
      case @facing
      when 'NORTH'
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

    def turn_robot_right
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
        puts "the facing attribute has a problem. #{@facing}"
      end
    end

    def turn_robot_left
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
        puts "the facing attribute has a problem. #{@facing}"
      end
    end

    def is_robot_placed
      if @position_x == -1 || @position_y == -1
        false
      else
        true
      end
    end

  end
end