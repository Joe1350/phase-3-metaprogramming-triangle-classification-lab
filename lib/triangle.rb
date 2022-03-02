class Triangle
  # write code here
  attr_reader :side1, :side2, :side3

  def initialize side1, side2, side3
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def kind
    validate_triangle
    if side1 == side2 && side1 == side3
      :equilateral
    elsif side1 == side2 || side2 == side3 || side3 == side1
      :isosceles
    elsif side1 != side2 && side1 != side3
      :scalene
    end
  end

  def positive?
    [side1, side2, side3].all?(&:positive?)
  end

  def valid_triangle
    side1 + side2 > side3 && side1 + side3 > side2 && side2 + side3 > side1
  end

  def validate_triangle
    raise TriangleError unless positive? && valid_triangle
  end

  class TriangleError < StandardError
    # triangle error code
  end
end
