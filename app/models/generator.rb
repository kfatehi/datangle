class Generator
  attr_reader :count, :range, :threshold

  def initialize(opts)
    @count = opts[:count] < 1 ? 4 : opts[:count]
    @range = opts[:range]
    @threshold = opts[:threshold] < 2 ? 25 : opts[:threshold]
  end

  def random_coordinate_triplet
    mid = @range.count/2
    [
      [rand(@range), rand(@range)],
      [mid, mid],
      [rand(@range), rand(@range)]
    ]
  end

  ##
  # Creates `count` triangles with sides sized within `range`
  # and an angle `threshold` in degrees
  def triangles()
    @triangles = []
    loop_start_time = Time.now
    while @triangles.size != @count
      begin
        t = Triangle.new(*random_coordinate_triplet)
        if t.possible? && within_threshold(t)
          @triangles << t
        else
          if (Time.now - loop_start_time) > 1
            raise 'too much calculation'
          end
        end
      rescue Math::DomainError
        puts "Out of domain... trying again."
      end
    end
    @triangles
  end

  def within_threshold(test_triangle)
    return true if @triangles.empty?
    @triangles.each do |triangle|
      difference = (triangle.angle_C - test_triangle.angle_C).abs
      if difference <= @threshold
        next
      else
        return false
      end
    end
    true
  end
end
