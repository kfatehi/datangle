class Generator
  attr_reader :count, :range, :too_far, :too_close

  def initialize(opts)
    @count = opts[:count].to_i.abs
    @too_far = opts[:too_far].to_i.abs
    @too_close = opts[:too_close].to_i.abs
    @count = @count < 1 ? 4 : @count
    @range = opts[:range]
    @too_far = @too_far < 2 ? 20 : @too_far
    @too_close = @too_close < 2 ? 4 : @too_close
    if @too_far < @too_close
      raise "impossible parameters"
    end
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
        if t.possible? && within_threshold(t) && within_threshold2(t)
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
      if difference <= @too_far
        next
      else
        return false
      end
    end
    true
  end

  def within_threshold2(test_triangle)
    return true if @triangles.empty?
    @triangles.each do |triangle|
      difference = (triangle.angle_C - test_triangle.angle_C).abs
      if difference <= @too_close
        return false
      else
        next
      end
    end
    true
  end
end
