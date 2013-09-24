# Exercise2. Write a Rectangle class. I shall use your class as follows:
# r = Rectangle.new(23.45, 34.67) 
# puts "Area is = #{r.area}"
# puts "Perimeter is = #{r.perimeter}"

class Rectangle
  attr_reader :area, :perimeter
  
  def initialize(width, length)
    @area = width * length
    @perimeter = 2 * (width + length)
  end
end
