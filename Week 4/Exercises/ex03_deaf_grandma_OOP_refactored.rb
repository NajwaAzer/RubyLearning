class Grandma
  #change accessor to reader since we don't want write access
  attr_reader :name, :memory, :bye_count, :deafness, :responses
  private :bye_count

  def initialize(name = 'Grandma', memory = 1930..1950, deafness = 3)
    @name       = name.capitalize
    @memory     = memory.to_a
    @bye_count  = 0
    @deafness   = deafness

    #grandma's responses
    @responses = {
      welcome:    "#{name}: Sonny I've missed ya! Come talk to me!",
      cant_hear:  "*awkward silence*",
      can_hear:   lambda {"#{name}: NO, NOT SINCE #{@memory.sample}!"}
      speak_up:   "#{name}: HUH? SPEAK UP, SONNY!",
      farewell:   "#{name}: BYE SONNY!"
    }
  end

# *&^%#@ *or check for two or more symbols*\

def responds(noise)
  # noise == heard(hh) ? h : o

  # change from sonny_gone to speaker_gone so it's more generic 
  def dismiss_speaker?
    @bye_count == @deafness
  end

  def greeting
    dismiss_speaker? ? responses[:farewell] : responses[:welcome]
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
      responses[:cant_hear]
    else
      @bye_count = 0
      if noise.empty?
        responses[:cant_hear]
      elsif noise == noise.upcase
        responses[:can_hear].call
      else
        responses[:speak_up]
      end
    end
  end
end

def noise
#change printf to print since we're not formatting the string
  print "You: "
  gets.chomp
end
  
granny = Grandma.new

puts granny.welcome
until granny.dismiss_speaker?
  puts granny.responds(noise)
end
puts granny.farewell