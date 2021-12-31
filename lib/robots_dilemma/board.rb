module RobotsDilemma
  class Board

    def initialize
      @height = ENV['BOARD_HEIGHT'].nil? ? 5 : ENV['BOARD_HEIGHT']
      @width = ENV['BOARD_WIDTH'].nil? ? 5 :ENV['BOARD_WIDTH']
    end

  end
end
