class MainController < ApplicationController
  def index
    @triangles = generate_possible_triangles(4, 2)
  end

  private

  def generate_possible_triangles(count, angle_threshold)
    triangles = []
    while triangles.size != count
      begin
        t = Triangle.new(rand(1..100),rand(1..100),rand(1..100))
        if within_threshold(t, angle_threshold) && t.possible?
          triangles << t
        end
      rescue Math::DomainError
        puts "Out of domain... trying again."
      end
    end
    triangles
  end

  def within_threshold(triangle, angle_threshold)

  end
end
