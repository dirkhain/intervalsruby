require "spec_helper"

describe "Interval Sort and Overlap calculation" do

  attr_reader :muli

  before :each do
    @muli = MaxUsersLoggedIn.new
    @interval1 = Interval.new 1, 2
    @interval2 = Interval.new 1, 3
    @interval3 = Interval.new 1, 2
    @interval4 = Interval.new 7, 10
    @interval5 = Interval.new 3, 20
    @interval6 = Interval.new 9, 9
    @interval7 = Interval.new 1, 4
    @interval8 = Interval.new -100, -10
    @interval9 = Interval.new -11, -1
    @interval10 = Interval.new -12, 0
    @interval11 = Interval.new 0, 10
    @interval12 = Interval.new -1, 12
  end

  describe "Sort intervals" do
    it "should return greater" do
      intervalSort(@interval2, @interval1).should eql 1
    end
    it 'should return less' do
       intervalSort(@interval1, @interval2).should eql -1
    end
    it 'should return equals' do
       intervalSort(@interval1, @interval3).should eql 0
    end
  end

  describe "Calculate overlaps" do
    it "should gracefully handle a one element list" do
      @muli.maxSystemUsage([@interval1]).should eql 1
    end
    it "should return 3 as max usage" do
      @muli.maxSystemUsage([@interval4, @interval5, @interval6, @interval7]).should eql 3
    end
    it "should not mind the same start time" do
      @muli.maxSystemUsage([@interval1, @interval2, @interval3]).should eql 3
    end
    it "should handle an array of copied intervals" do
      @muli.maxSystemUsage([@interval4, @interval4, @interval4]).should eql 3
    end
    it "should handle intervals with negative numbers" do
      @muli.maxSystemUsage([@interval8, @interval9, @interval10, @interval11, @interval12]).should eql 3
    end
  end

end