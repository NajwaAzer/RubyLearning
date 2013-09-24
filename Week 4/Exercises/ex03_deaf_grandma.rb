# - Modify your Deaf Grandma program (Week 3 / Exercise6):

# What if grandma doesn't want you to leave? When you shout BYE, she could pretend not to hear you.

# Change your previous program so that you have to shout BYE three times in a row. Make sure to test your program: if you shout BYE three times, but not in a row, you should still be talking to grandma. You must shout BYE three separate times. If you shout BYEBYEBYE or BYE BYE BYE, Grandma should pretend not to hear you (and not count it as a BYE).

years = (1930..1950).to_a
bye_count = 0

puts "Grandma: Sonny I've missed ya! Come talk to me!"

until bye_count = 3
  printf "You: "
  words_to_grandma = gets.chomp
  case words_to_grandma
  when 'BYE'
    bye_count += 1
    puts "Grandma: HUH? SPEAK UP, SONNY!"
  else
    bye_count = 0
    if words_to_grandma == words_to_grandma.upcase
      puts "Grandma: NO, NOT SINCE #{years[rand(years.size)]}!"
    else
      puts "Grandma: HUH? SPEAK UP, SONNY!"
    end
  end
end

puts 'Grandma: BYE SONNY!'
