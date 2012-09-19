class Triangle

  def initialize(*side_lengths)
    begin
      @a, @b, @c = side_lengths.map{|i|i.to_f}
      @A = angle_A.to_degrees.round(3)
      @C = inverse_cosC.to_degrees.round(3)
      @B = (180 - (@A + @C)).round(3)
    rescue
      @possible = false
    end
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

  def possible?
    @possible.nil? ? !has_zero_length_legs_or_angles? : false
  end

  def has_zero_length_legs_or_angles?
    side_lengths.find{|i| i==0} || internal_angles.find{|i| i==0}
  end
end
