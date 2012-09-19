module MainHelper
  def sort_by_middle_angle(triangles)
    triangles.sort do |a,b|
      a.angles[1] <=> b.angles[1]
    end
  end

  def canvas(id)
    %{  <canvas id="#{id}"
        width="200" height="200">
        </canvas>  
    }.html_safe
  end
end
