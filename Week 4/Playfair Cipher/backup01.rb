def preprocess(message)
  message.upcase!.gsub!(/[^A-Z]/, '')
  letter_array = message.chars

  insert_count = 0
  insert_array = ['X', 'Z']
  last_insert = letter_array.length

  letter_array.each_with_index do |letter, index|
    if index.odd? && letter == letter_array[index-1]
      letter_to_insert = index - last_insert == -2 ? 'Z' : 'X'
      letter_array.insert(index, letter_to_insert)
      puts "#{letter}, #{letter_array[index-1]}, #{[index]} INSERT #{letter_to_insert}, #{last_insert if defined?(last_insert)}!"
      puts last_insert = index
      puts
    end
  end
  letter_array << 'X' if letter_array.length.odd?

  new_message = []
  letter_array.each_slice(2) { |first, second| new_message << [first, second]}
  new_message.each do |row|
    # puts row.join
  end
end

my_preprocessed_message = preprocess("Congress shall make no law respecting an establishment of religion, or prohibiting the free exercise thereof; or abridging the freedom of speech, or of the press; or the right of the people peaceably to assemble, and to petition the government for a redress of grievances.")

# preprocess("Hide the gold in the tree stump")
# puts
# preprocessed_message = preprocess("Congress Shall")def build_square(phrase)
  
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
  cipher_square.each do |row|
    puts row.join(" ")
  end
  cipher_square
end

# build_square("playfair example")
# puts
# build_square("I Love Ruby.")require_relative 's01_build_the_square'
require_relative 's02_preprocess_message'

def locations(message, cipher_square)
  message.each_with_index do |digraph, digraph_number|
    digraph.each_with_index do |letter, letter_number|
      cipher_square.each_with_index do |row, row_number|
        if row.index(letter)  
          message[digraph_number][letter_number] = [row_number, row.index(letter)]
          # puts "letter: #{letter}, row: #{row_number}, column: #{row.index(letter)}" 
        end
      end
    end
  end
  message
end

def new_locations(locations)
  p locations
  locations.each do |digraph|
    if digraph[0][0] == digraph[1][0]
      digraph[0][1] == 4 ? digraph[0][1] = 0 : digraph[0][1] += 1
      digraph[1][1] == 4 ? digraph[1][1] = 0 : digraph[1][1] += 1
    elsif digraph[0][1] == digraph[1][1]
      digraph[0][0] == 4 ? digraph[0][0] = 0 : digraph[0][0] += 1
      digraph[1][0] == 4 ? digraph[1][0] = 0 : digraph[1][0] += 1
    else
      digraph[0][1] , digraph[1][1] = digraph[1][1] , digraph[0][1]
    end
  end
  locations
end

def encipher(message, cipher_square)
  my_locations      = locations(message, cipher_square)
  enciphered        = new_locations(my_locations) 
  enciphered.each_with_index do |digraph, digraph_number|
    digraph.map! do |letter_location|
      cipher_square[letter_location[0]][letter_location[1]]
    end
  end
  enciphered.each do |diagraph|
    p diagraph.join("")
  end
  p enciphered
end

my_cipher_square = build_square("playfair example")
my_message = preprocess("Hide the gold in the tree stump")

my_cipher_square = build_square("First Amendment")
my_preprocessed_message = preprocess("Congress shall make no law respecting an establishment of religion, or prohibiting the free exercise thereof; or abridging the freedom of speech, or of the press; or the right of the people peaceably to assemble, and to petition the government for a redress of grievances.")
encipher(my_preprocessed_message, my_cipher_square)


# change method so it just deals with ONE pair at a time and just spits out the new location!