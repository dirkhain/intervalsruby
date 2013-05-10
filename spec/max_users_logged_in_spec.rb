require "spec_helper"

describe "Interval Sort" do

  before :each do
    @interval1 = Interval.new 1, 2
    @interval2 = Interval.new 1, 3
    @interval3 = Interval.new 3, 4
    @interval4 = Interval.new 1, 2
  end

  describe "sort 2 intervals" do
    it "should return greater" do
      intervalSort(@interval2, @interval1).should eql 1
    end
    it 'should return less' do
       intervalSort(@interval1, @interval2).should eql -1
    end
    it 'should return equals' do
       intervalSort(@interval1, @interval4).should eql 0
    end
  end

end