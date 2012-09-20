class Triangle
  attr_reader :coordinates

  def initialize(a,b,c)
    begin
      @coordinates = [
        {x: a[0], y: a[1]},
        {x: b[0], y: b[1]}, 
        {x: c[0], y: c[1]}
      ]
      @a = Math.sqrt(((b[0]-a[0])**2)+((b[1]-a[1])**2)).round(3)
      @b = Math.sqrt(((c[0]-b[0])**2)+((c[1]-b[1])**2)).round(3)
      @c = Math.sqrt(((a[0]-c[0])**2)+((a[1]-c[1])**2)).round(3)
      @A = angle_A.to_degrees.round(3)
      @C = inverse_cosC.to_degrees.round(3)
      @B = (180 - (@A + @C)).round(3)
    rescue
      @possible = false
    end
  end

  def third_vertex
    x = ((@b**2)+(@a**2)-(@c**2))/(2*@a)
    y = Math.sqrt((@b**2)-(x**2))
    { x: x.round(3), y: y.round(3) }
  end

  def side_lengths
    [@a, @b, @c].map{|l| l.round(3) }
  end

  def internal_angles
    [@A, @B, @C]
  end

  alias_method :angles, :internal_angles

  def cosC
    ((@a**2)+(@b**2)-(@c**2)) / (2*@a*@b)
  end

  def inverse_cosC
    Math.acos(cosC)
  end

  def sinA
    (@a*Math.sin(inverse_cosC))/4
  end

  def angle_A
    Math.asin(sinA)
  end

  def angle_B
    @B
  end

  def angle_C
    @C
  end

  def possible?
    @possible.nil? ? !has_zero_length_legs_or_angles? : false
  end

  def has_zero_length_legs_or_angles?
    side_lengths.find{|i| i==0} || internal_angles.find{|i| i==0}
  end

  def *(factor)
    @a*=factor
    @b*=factor
    @c*=factor
    @coordinates.map! do |c|
      c[:x] *= factor
      c[:y] *= factor
      c
    end
    self
  end
end
