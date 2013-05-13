require 'rspec'
require "spec_helper"
require "interval_generator"

describe 'Performance tests for interval overlap calculation' do

  before :each do
    @muli = MaxUsersLoggedIn.new
    @generator = IntervalGenerator.new
  end

  it 'calculate [1,000,000; 2,000,000; 5,000,000; 10,000,000] intervals' do
    testcases = [1000000, 2000000, 5000000, 10000000]
    testcases.each do |numIntervals|
      runPerTest(numIntervals)
    end
  end

end

def runPerTest(numIntervals)
  start = Time.now
  overlaps = @muli.maxSystemUsage(@generator.generateIntervals(numIntervals))
  stop = Time.now
  timetaken = stop - start
  puts "Calculating #{numIntervals} intervals took #{timetaken}s and found #{overlaps} overlaps."
end
