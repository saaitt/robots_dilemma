module RobotsDilemma
  class Board

    def initialize
      @height = ENV['BOARD_HEIGHT'].nil? ? 5 : ENV['BOARD_HEIGHT']
      @width = ENV['BOARD_WIDTH'].nil? ? 5 :ENV['BOARD_WIDTH']
    end

    def check_positions(position)
      x = position[0]
      y = position[1]
      facing = position[2]
      if x > 0 && x <= @width
        if y > 0 && y <= @height
          if facing == "NORTH" || facing == "SOUTH" || facing == "EAST" || facing == "WEST"
            return true
          end
        end
      end
      false
    end

  end
end
