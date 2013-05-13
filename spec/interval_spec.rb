require "spec_helper"

describe "Interval Object" do

  before :each do
    @interval = Interval.new 1, 2
  end

  describe "#new" do
    it "return a new Interval object" do
      @interval.should be_an_instance_of Interval
    end

    it "throws an argument exception with fewer than 2 arguments" do
      lambda {Interval.new(3)}.should raise_exception ArgumentError
    end

    it "throws an argument error with more than 2 arguments" do
      lambda {Interval.new(1,2,3)}.should raise_exception ArgumentError
    end

    it "throws an assertion if start is larger than finish" do
      lambda {Interval.new(3,2)}.should raise_exception "Invalid interval"
    end

  end

  describe "@start" do
    it "returns the start of the interval" do
      @interval.start.should eql 1
    end
    it "throws a NoMethodError" do
      lambda {@interval.start=10}.should raise_exception NoMethodError
    end
  end

end
