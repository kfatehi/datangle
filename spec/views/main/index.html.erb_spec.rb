require 'spec_helper'

describe "main/index.html.erb" do
  it "has a canvas" do
    render.should include "canvas"
  end
end
