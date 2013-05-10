require_relative 'interval'

class MaxUsersLoggedIn

  # @param [Interval] intervalList
  def maxSystemUsage(intervalList)

    if intervalList.respond_to?("each")
      intervalList.sort!{|x,y| intervalSort(x,y)}
    else
      puts "Requires array of intervals."
    end

    intervalPrint(intervalList)

  end
end


def intervalSort(int1, int2)
  return int1.start <=> int2.start unless int1.start == int2.start
  return int1.finish <=> int2.finish
end

def intervalPrint(list)
  if list.respond_to?("each")
    list.each do |interval|
      puts ">>#{interval.start}|#{interval.finish}<<"
    end
  else
    puts list.to_s
  end
  puts "\n"
end



if __FILE__ == $0
  intervalList = [Interval.new(2,3), Interval.new(5,5), Interval.new(1,2)]
  muli = MaxUsersLoggedIn.new
  muli.maxSystemUsage(intervalList)

  intervalList = [Interval.new(1,3), Interval.new(1,5), Interval.new(1,1)]
  muli.maxSystemUsage(intervalList)

end