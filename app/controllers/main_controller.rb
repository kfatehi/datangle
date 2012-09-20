class MainController < ApplicationController
  def index
    options = {
      count:params[:number_of_angles].to_i, 
      range:1..8, 
      threshold:params[:angle_threshold].to_i
    }
    @generator = Generator.new(options)
    begin
      @triangles = @generator.triangles.map{|t| t*30}
    rescue => ex
      render text: "Error: #{ex.message}"
    end
  end
end
