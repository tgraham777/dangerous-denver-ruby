require_relative 'parser'

class Runner
  def initialize
    Parser.new("./data/traffic-accidents.csv").parse
  end
end

Runner.new
