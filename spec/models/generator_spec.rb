require 'spec_helper'

describe Generator do
  it "generates triangles" do
    g = Generator.new
    g.triangles(4, 1..8, 5).count.should eq 4
  end
end
