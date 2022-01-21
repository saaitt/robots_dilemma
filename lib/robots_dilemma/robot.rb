module RobotsDilemma
  class Robot
    def initialize
      @position_x = -1
      @position_y = -1
      @facing = "NORTH"
    end

    def place(input)
      facing, x, y = map_input_to_positions(input)
      if $board.is_valid_position([x, y, facing])
        place_robot(facing, x, y)
      end
    end

    def move
      if is_robot_placed
        next_x, next_y = calculate_robot_next_coordinate
        if $board.is_valid_position([next_x, next_y, @facing])
          place_robot(@facing, next_x, next_y)
        end
      end
    end

    def right
      if is_robot_placed
        turn_robot_right
      end
    end

    def left
      if is_robot_placed
        turn_robot_left
      end
    end

    def report
      if is_robot_placed
        "#{@position_x},#{@position_y},#{@facing}"
      end
    end

    private

    def method_missing(symbol, *args)
      puts "sorry i can't do that"
    end

    def map_input_to_positions(input)
      positions_array = input[1].split(',')
      x = positions_array[0].to_i
      y = positions_array[1].to_i
      facing = positions_array[2]
      return facing, x, y
    end

    def place_robot(facing, x, y)
      @position_x = x
      @position_y = y
      @facing = facing
    end

    def calculate_robot_next_coordinate
      x = @position_x
      y = @position_y
      case @facing
      when 'NORTH'
        y += 1
      when 'SOUTH'
        y -= 1
      when 'EAST'
        x += 1
      when 'WEST'
        x -= 1
      else
        puts 'invalid input'
      end
      return x, y
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