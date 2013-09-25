class Shape
  def click
    puts "You clicked on a #{self.class.to_s.downcase}"
    rotate
    play_sound
  end

  def rotate
    puts "Rotating clockwise 360 degrees"
  end

  def play_sound
    puts "Playing the sound #{sound}"
  end
end

class Square < Shape
  def sound
    "square.aif"
  end
end

class Circle < Shape
  def sound
    "circle.aif"
  end
end

class Triangle < Shape
  def sound
    "triangle.aif"
  end
end

class Amoeba < Shape
  def sound
    "amoeba.hif"
  end

  def rotate
    puts "Rotating around a point on one end"
  end
end

Square.new.click
Circle.new.click
Triangle.new.click
Amoeba.new.click