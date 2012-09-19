class Triangle

  def initialize(*side_lengths)
    @a, @b, @c = side_lengths.map{|i|i.to_f}
    @A = angle_A.to_degrees
    @C = inverse_cosC.to_degrees
    @B = 180 - (@A + @C)
  end

  def side_lengths
    [@a, @b, @c]
  end

  def internal_angles
    [@A, @B, @C]
  end

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
end
