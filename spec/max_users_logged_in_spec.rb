require "spec_helper"

describe "Interval Sort" do

  before :each do
    @interval1 = Interval.new 1, 2
    @interval2 = Interval.new 1, 3
    @interval3 = Interval.new 1, 2
  end

  describe "sort 2 intervals" do
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

  describe "run with only one value" do
    it "should return a help message" do
      muli = MaxUsersLoggedIn.new
#      muli.maxSystemUsage([@interval1]).should eql nil
    end
  end


end