# Write a Deaf Grandma program. Whatever you say to grandma (whatever you type in), she should respond with HUH?! SPEAK UP, SONNY!, unless you shout it (type in all capitals). If you shout, she can hear you (or at least she thinks so) and yells back, NO, NOT SINCE 1938! To make your program really believable, have grandma shout a different year each time; maybe any year at random between 1930 and 1950. You can't stop talking to grandma until you shout BYE.

years = (1930...1951).to_a

puts "Grandma: Sonny I've missed ya! Come talk to me!"

printf "You: "
words_to_grandma = gets.chomp

while words_to_grandma != 'BYE'
  case words_to_grandma
  when words_to_grandma == words_to_grandma.upcase
    puts "Grandma: NO, NOT SINCE #{years[rand(years.size)]}!"
  else
    puts "Grandma: HUH? SPEAK UP, SONNY!"
  end
  printf "You: "
  words_to_grandma = gets.chomp
end

puts 'Grandma: BYE SONNY!'
