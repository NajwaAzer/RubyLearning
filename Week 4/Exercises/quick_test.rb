class Grandma
  #change accessor to reader since we don't want write access
  attr_reader :name, :years, :bye_count, :bye_stop

  def initialize(name = 'Grandma', years = 1930..1950, bye_stop = 3)
    @name       = name.capitalize
    @years      = years.to_a
    @bye_count  = 0
    @bye_stop   = bye_stop

    #grandma's responses
    @welcome    = "#{@name}: Sonny I've missed ya! Come talk to me!"
    @cant_hear  = "*awkward silence*"
    @can_hear   = "#{@name}: NO, NOT SINCE #{@years.sample}!"
    @speak_up   = "#{@name}: HUH? SPEAK UP, SONNY!"
    @farewell   = "#{@name}: BYE SONNY!"
  end

  # change from sonny_gone to speaker_gone so it's more generic 
  def speaker_gone?
    @bye_count == @bye_stop
  end

  def greeting
    speaker_gone? ? @farewell : @welcome
  end

  # alias greeting method so there's only one method to maintain
  alias :welcome :greeting 
  alias :farewell :greeting   

  # change parameter from sonny_says to noise
  # change string outputs to instance variables that can be maintained from one spot
  def responds(noise)
    case noise
    when 'BYE'
      @bye_count += 1
      @cant_hear
    else
      @bye_count = 0
      if !noise.empty? && noise == noise.upcase
        @can_hear
      elsif noise.empty?
        @cant_hear
      else
        @speak_up
      end
    end
  end

  def converse
    puts welcome
    until speaker_gone?
      puts responds(sonny_says)
    end
    puts farewell
  end
end

def sonny_says
#change printf to print since we're not formatting the string
  print "You: "
  gets.chomp
end
  
granny = Grandma.new
granny.converse