require_relative "spec_helper"

class IntervalGenerator

  def generateIntervals(numIntervals)
    intervalArray = []
    numIntervals.times do
      interval = 2.times.map{rand(99999999)}
      if interval[0] < interval[1]
        intervalArray = intervalArray.push(Interval.new(interval[0], interval[1]))
      elsif
        intervalArray = intervalArray.push(Interval.new(interval[1], interval[0]))
      end
    end
    intervalArray
  end

end

if __FILE__ == $0
  generator = IntervalGenerator.new
  puts "#{generator.generateIntervals(10)}"
end