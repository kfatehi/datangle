module MainHelper
  def sort_by_angle_c(triangles)
    triangles.sort do |a,b|
      a.angles[2] <=> b.angles[2]
    end
  end
end
