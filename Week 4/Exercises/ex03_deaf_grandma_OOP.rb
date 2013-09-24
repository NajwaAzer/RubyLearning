# - Modify your Deaf Grandma program (Week 3 / Exercise6):

# What if grandma doesn't want you to leave? When you shout BYE, she could pretend not to hear you.

# Change your previous program so that you have to shout BYE three times in a row. Make sure to test your program: if you shout BYE three times, but not in a row, you should still be talking to grandma. You must shout BYE three separate times. If you shout BYEBYEBYE or BYE BYE BYE, Grandma should pretend not to hear you (and not count it as a BYE).

class Grandma
  attr_accessor :name, :years, :bye_count, :bye_stop

  def initialize(name = 'Grandma', years = 1930..1950, bye_stop = 3)
    @name = name.capitalize
    @years = years.to_a
    @bye_count = 0
    @bye_stop = bye_stop
  end

  def welcome
    "#{@name}: Sonny I've missed ya! Come talk to me!"
  end

  def sonny_gone?
    @bye_count == @bye_stop
  end

  def responds(sonny_says)
    case sonny_says
    when 'BYE'
      @bye_count += 1
      "#{@name}: HUH? SPEAK UP, SONNY!"
    else
      @bye_count = 0
      if sonny_says == sonny_says.upcase
        "#{@name}: NO, NOT SINCE #{@years[rand(@years.size)]}!"
      else
        "#{@name}: HUH? SPEAK UP, SONNY!"
      end
    end
  end

  def farewell
    "#{@name}: BYE SONNY!"
  end
end

def sonny_says
  printf "You: "
  gets.chomp
end
  
granny = Grandma.new
puts granny.welcome

until granny.sonny_gone?
  puts granny.responds(sonny_says)
end

puts granny.farewell
