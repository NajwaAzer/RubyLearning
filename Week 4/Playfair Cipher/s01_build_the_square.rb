# Step 1: Write the snippet to make the 5 x 5 square table.
# Example 1: Using "playfair example" as the key, the table becomes: 
# P L A Y F
# I R E X M
# B C D G H
# K N O Q S
# T U V W Z

def build_square(phrase)
  
  # keep only letters
  phrase.upcase!.gsub!(/[^A-Z]/, '')
  letters = phrase.chars.uniq

  # determine which letters to add
  alphabet = ('A'..'Z').to_a
  alphabet -= ['J']
  remaining_letters = alphabet - letters
  keyphrase_letters = letters + remaining_letters

  # create cipher square
  cipher_square = Array.new(5) { Array.new(5,true) }
  cipher_square.each do |row|
    row.map! { |cell| keyphrase_letters.shift }
  end
  cipher_square.map! { |row| row.join(" ") }
end

my_cipher_square = build_square("playfair example")
puts my_cipher_square
puts
my_cipher_square_2 = build_square("I Love Ruby.")
puts my_cipher_square_2