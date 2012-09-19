class MainController < ApplicationController
  def index
    g = Generator.new
    @triangles = g.triangles(4, 1..8, 25).map{|t| t*20}
  end
end
