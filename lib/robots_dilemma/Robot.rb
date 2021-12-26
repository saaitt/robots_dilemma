module RobotsDilemma
  class Robot
    def initialize
      @position_x = 0
      @position_y = 0
      @facing = "NORTH"
    end

    def report
      puts "#{@position_x},#{@position_y},#{@facing}"
    end
  end
end