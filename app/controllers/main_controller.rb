class MainController < ApplicationController
  def index
    @triangles = generate_valid_triangles(4)
  end

  private

  def generate_valid_triangles(number)
    triangles = []
    while triangles.size != number
      begin
        t = Triangle.new(rand(1..10),rand(1..10),rand(1..10))
        triangles << t if t.possible?
      rescue Math::DomainError
        puts "Out of domain... trying again."
      end
    end
    triangles
  end
end
