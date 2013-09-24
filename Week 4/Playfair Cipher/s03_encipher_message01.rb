require_relative 's01_build_the_square'

def encipher(digraph, cipher_square)
  # replace letter with current location
  digraph.each_with_index do |letter, letter_number| 
    cipher_square.each_with_index do |row, row_number|
      if row.index(letter)  
        digraph[letter_number] = [row_number, row.index(letter)]
      end
    end   
  end

  # replace current with new location
  if digraph[0][0] == digraph[1][0]
    digraph[0][1] == 4 ? digraph[0][1] = 0 : digraph[0][1] += 1
    digraph[1][1] == 4 ? digraph[1][1] = 0 : digraph[1][1] += 1
  elsif digraph[0][1] == digraph[1][1]
    digraph[0][0] == 4 ? digraph[0][0] = 0 : digraph[0][0] += 1
    digraph[1][0] == 4 ? digraph[1][0] = 0 : digraph[1][0] += 1
  else
    digraph[0][1] , digraph[1][1] = digraph[1][1] , digraph[0][1]
  end

  # replace new location with new letter
  digraph.map! do |letter_location|
      cipher_square[letter_location[0]][letter_location[1]]
  end
end

def decipher(digraph, cipher_square)
  # replace letter with current location
  digraph.each_with_index do |letter, letter_number| 
    cipher_square.each_with_index do |row, row_number|
      if row.index(letter)  
        digraph[letter_number] = [row_number, row.index(letter)]
      end
    end   
  end

  # replace current with new location
  if digraph[0][0] == digraph[1][0]
    digraph[0][1] == 0 ? digraph[0][1] = 0 : digraph[0][1] -= 1
    digraph[1][1] == 0 ? digraph[1][1] = 0 : digraph[1][1] -= 1
  elsif digraph[0][1] == digraph[1][1]
    digraph[0][0] == 0 ? digraph[0][0] = 0 : digraph[0][0] -= 1
    digraph[1][0] == 0 ? digraph[1][0] = 0 : digraph[1][0] -= 1
  else
    digraph[0][1] , digraph[1][1] = digraph[1][1] , digraph[0][1]
  end

  # replace new location with new letter
  digraph.map! do |letter_location|
      cipher_square[letter_location[0]][letter_location[1]]
  end
end


my_cipher_square = build_square("playfair example")
puts
p encipher(['E', 'D'], my_cipher_square)
puts
p decipher(['D', 'O'], my_cipher_square)

# my_cipher_square = build_square("First Amendment")
# my_preprocessed_message = preprocess("Congress shall make no law respecting an establishment of religion, or prohibiting the free exercise thereof; or abridging the freedom of speech, or of the press; or the right of the people peaceably to assemble, and to petition the government for a redress of grievances.")
# encipher(my_preprocessed_message, my_cipher_square)