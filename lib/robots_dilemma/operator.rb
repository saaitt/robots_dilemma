module RobotsDilemma
  class Operator

    def initialize
      @board = RobotsDilemma::Board.new
      @robot = RobotsDilemma::Robot.new
    end

    def place(input)
      unless input[1].nil?
        position = input[1].split(',')
        unless @board.check_positions(position)
          @robot.place(position[0].to_i, position[1].to_i, position[2])
        end
      end
    end

  end
end
