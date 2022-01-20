module RobotsDilemma
  class Board

    def initialize
      @height = ENV['BOARD_HEIGHT'].nil? ? 5 : ENV['BOARD_HEIGHT'].to_i
      @width = ENV['BOARD_WIDTH'].nil? ? 5 : ENV['BOARD_WIDTH'].to_i
    end

    def check_positions(position)
      x = position[0].to_i
      y = position[1].to_i
      facing = position[2]
      if x >= 0 && x < @width
        if y >= 0 && y < @height
          if facing == "NORTH" || facing == "SOUTH" || facing == "EAST" || facing == "WEST"
            return true
          end
        end
      end
      false
    end

    def can_move(position)
      x = position[0].to_i
      y = position[1].to_i
      facing = position[2]
      case facing
      when "NORTH"
        if y < @height
          return true
        end
        false
      when "SOUTH"
        if y > 0
          return true
        end
        false
      when "EAST"
        if x < @width
          return true
        end
        false
      when "WEST"
        if x > 0
          return true
        end
        false
      else
        false
      end
    end

  end
end
