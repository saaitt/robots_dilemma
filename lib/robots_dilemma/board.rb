module RobotsDilemma
  class Board

    def initialize
      @length = ENV['BOARD_LENGTH'].nil? ? 5 : ENV['BOARD_LENGTH']
      @width = ENV['BOARD_WIDTH'].nil? ? 5 :ENV['BOARD_WIDTH']
    end

  end
end
