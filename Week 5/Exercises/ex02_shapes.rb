class Shape
  attr_reader :shape, :extension, :rotation

  def initialize
    @shape = self.class.to_s.downcase
    @extension = '.aif'
    @rotation = "Rotating clockwise 360 degrees"
  end

  def click
    puts "You clicked on a #{shape}"
    puts rotate
    puts play_sound
  end

  def rotate
    rotation
  end

  def play_sound
    "Playing the sound #{shape + " " + extension}"
  end
end

class Square < Shape ; end
class Circle < Shape ; end
class Triangle < Shape ; end

class Amoeba < Shape
  def initialize
    super
    @extension = '.hif'
    @rotation = 'Rotating around a point on one end'
  end
end

[Square.new, Circle.new, Triangle.new, Amoeba.new].each do |shape| 
  shape.click
end