module RobotsDilemma
  class Board

    def initialize
      @height = ENV['BOARD_HEIGHT'].nil? ? 5 : ENV['BOARD_HEIGHT'].to_i
      @width = ENV['BOARD_WIDTH'].nil? ? 5 : ENV['BOARD_WIDTH'].to_i
    end

    def is_valid_position(position)
      facing, x, y = extract_x_y_facing_from_str_command(position)
      if check_x_edge(x)
        if check_y_edge(y)
          if is_facing_valid(facing)
            return true
          end
        end
      end
    end

    private

    def is_facing_valid(facing)
      facing == "NORTH" || facing == "SOUTH" || facing == "EAST" || facing == "WEST"
    end

    def check_y_edge(y)
      y >= 0 && y < @height
    end

    def check_x_edge(x)
      x >= 0 && x < @width
    end

    def extract_x_y_facing_from_str_command(position)
      x = position[0].to_i
      y = position[1].to_i
      facing = position[2]
      return facing, x, y
    end

  end
end
