class Interval
  attr_reader :start, :finish

  def initialize (start, finish)
    raise "Invalid interval" unless start <= finish
    @start = start
    @finish = finish
  end

end