require "rbtree"
require_relative 'interval'

class MaxUsersLoggedIn

  attr_reader :maxUsers

  # @param [Interval] intervalList
  def maxSystemUsage(intervalList)
    @maxUsers = 0
    if intervalList.respond_to?("each")
      intervalList.sort!{|x,y| intervalSort(x,y)}
    else
      puts "Requires array of intervals."
    end
#    intervalPrint(intervalList)

    logouts = MultiRBTree.new
    currentSessions = 0

    for interval in intervalList
      login = interval.start
      logout = interval.finish
      unless logouts.empty?
        until logouts.length == 0 || logouts.first[0] >= login
          currentSessions -= 1
          logouts.delete(logouts.first[0])
        end
      end
      logouts.store(logout, "nil") #MultiRBTree returns array per value
      currentSessions += 1
      if @maxUsers < currentSessions
        @maxUsers = currentSessions
      end
    end
    return @maxUsers
  end
end


def intervalSort(int1, int2)
  unless int1.start == int2.start
    return int1.start <=> int2.start
  end
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
  muli = MaxUsersLoggedIn.new
  intervalList = [Interval.new(2,3), Interval.new(5,5), Interval.new(1,2)]
  puts "#{muli.maxSystemUsage(intervalList)}!"

  intervalList = [Interval.new(1,3), Interval.new(1,5), Interval.new(1,1)]
  puts "#{muli.maxSystemUsage(intervalList)}!"

  puts "#{muli.maxSystemUsage([Interval.new(1,3)])}!"

end