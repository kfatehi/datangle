class Generator

  ##
  # Creates `count` triangles with sides sized within `range`
  # and an angle `threshold` in degrees
  def triangles(count, range, threshold)
    triangles = []
    loop_start_time = Time.now
    while triangles.size != count
      begin
        t = Triangle.new(rand(range),rand(range),rand(range))
        if t.possible? && within_threshold(t, triangles, threshold)
          triangles << t
        else
          if (Time.now - loop_start_time) > 2
            raise 'Too much calculation.'
          end
        end
      rescue Math::DomainError
        puts "Out of domain... trying again."
      end
    end
    triangles
  end

  def within_threshold(test_triangle, triangles, degs_allowed)
    triangles.each do |triangle|
      begin
        degs = (triangle.angle_C - test_triangle.angle_C).abs
        degs <= degs_allowed ? (return false) : next
      rescue
        binding.pry
      end
    end
  end
end
