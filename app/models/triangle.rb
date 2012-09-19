class Triangle
  attr_reader :coordinates

  def initialize(*side_lengths)
    begin
      @a, @b, @c = side_lengths.map{|i|i.to_f}
      @A = angle_A.to_degrees.round(3)
      @C = inverse_cosC.to_degrees.round(3)
      @B = (180 - (@A + @C)).round(3)
      @coordinates = [
        {x: 0, y: 0},
        {x: @a, y: 0}, 
        third_vertex
      ]
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
    [@a, @b, @c]
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
    @coordinates = [
      {x: 0, y: 0},
      {x: @a, y: 0}, 
      third_vertex
    ]
    self
  end
end
