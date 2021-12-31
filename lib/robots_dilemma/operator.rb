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

    def move(input)
      position = @robot.report
      if @board.can_move(position.split(','))
        @robot.move
      end
    end

    def left(input)
      @robot.turn "LEFT"
    end

    def right(input)
      @robot.turn "RIGHT"
    end

    def report(input)
      puts "#{@robot.report}"
    end
  end
end
