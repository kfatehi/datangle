class MainController < ApplicationController
  def index
    options = {
      count:params[:number_of_angles], 
      range:1..8, 
      too_far:params[:too_far],
      too_close:params[:too_close]
    }
    @generator = Generator.new(options)
    begin
      @triangles = @generator.triangles.map{|t| t*30}
    rescue => ex
      render text: "Error: #{ex.message}"
    end
  end
end
