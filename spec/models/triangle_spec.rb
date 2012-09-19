require 'spec_helper'

##
# Basically just porting this URL to ruby: 
# http://www.teacherschoice.com.au/maths_library/trigonometry/solve_trig_sss.htm 
describe Triangle do
  before do 
    @t = Triangle.new(2,3,4)
  end

  it "has coordinates" do
    @t.coordinates.count.should eq 3
  end

  it "knows if it is possible" do
    Triangle.new(0,2,1).should_not be_possible
    @t.should be_possible
  end

  it "has 3 side lengths" do
    @t.side_lengths.count.should eq 3
  end

  it "knows its side lengths" do
    @t.side_lengths.should eq [2,3,4]
  end
  
  it "has 3 internal angles" do
    @t.internal_angles.count.should eq 3
  end

  it "has angles aliased to internal angles" do
    @t.angles.should eq @t.internal_angles
  end

  it "knows its internal angles" do
    answers = [28.955,46.567,104.478]
    @t.internal_angles.should eq answers
  end

  it "knows its internal angles in degrees to the nearest " do
    # @t.internal_angles.should eq [29, 47, 104]
  end

  describe "the cosine rule" do
    it "gets cosC" do
      @t.cosC.should eq -0.25
    end

    it "gets the inverse cosine of cosC in degrees" do
      @t.inverse_cosC.to_degrees.round(3).should eq 104.478
    end
  end

  describe "the sine rule" do
    it "gets sinA" do
      @t.sinA.round(6).should eq 0.484123
    end
    it "gets angle A" do
      @t.angle_A.to_degrees.round(3).should eq 28.955  
    end
  end

  describe "the sum of internal angles rule" do
    it "gets angle B already in degrees" do
      @t.angle_B.round(3).should eq 46.567
    end
  end
end
