module RobotsDilemma
  class Operator

    def initialize
      @board = RobotsDilemma::Board.new
      @robot = RobotsDilemma::Robot.new
    end

    def place(input)
      unless input[1].nil?
        position = input[1].split(',')
        if @board.check_positions(position)
          @robot.place(position[0].to_i, position[1].to_i, position[2])
        end
      end
    end

    def move
      position = @robot.report
      unless position.nil?
        if @board.can_move(position.split(','))
          @robot.move
        end
      end
    end

    def left
      @robot.turn "LEFT"
    end

    def right
      @robot.turn "RIGHT"
    end

    def report
      @robot.report
    end

    private def method_missing(symbol, *args)
      puts "sorry i can't do that"
    end

  end
end
