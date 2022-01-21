module RobotsDilemma
  class OutputManager
    def print(result)
      puts "output #{result[:x]},#{result[:y]},#{result[:facing]}" unless result.nil?
    end
  end
end
