# Step 3: Write the snippet to convert the paired charactors (the formed message).

# Example to encrypt:
 
# TU --> UV
# DE --> OD
# HI --> BM

require_relative 's01_build_the_square'

def encipher(pair, cipher_square)
  # convert letter pair to an array (eg. 'TU' --> ['T', 'U'])
  cipher_square_array = cipher_square.map { |row| row.split(" ") }
  digraph = pair.split("")

  # replace letter with current location
  digraph.each_with_index do |letter, letter_number| 
    cipher_square_array.each_with_index do |row, row_number|
      if row.index(letter)  
        digraph[letter_number] = [row_number, row.index(letter)]
      end
    end   
  end

  # replace current with new location
  if digraph[0][0] == digraph[1][0] # same row
    digraph[0][1] == 4 ? digraph[0][1] = 0 : digraph[0][1] += 1
    digraph[1][1] == 4 ? digraph[1][1] = 0 : digraph[1][1] += 1
  elsif digraph[0][1] == digraph[1][1] # same column
    digraph[0][0] == 4 ? digraph[0][0] = 0 : digraph[0][0] += 1
    digraph[1][0] == 4 ? digraph[1][0] = 0 : digraph[1][0] += 1
  else # corners of a rectangle
    digraph[0][1] , digraph[1][1] = digraph[1][1] , digraph[0][1]
  end

  # replace new location with new letter
  digraph.map! do |letter_location|
      cipher_square_array[letter_location[0]][letter_location[1]]
  end

  # convert array to a letter pair (eg. ['U', 'V'] --> "UV")
  digraph.join
end

my_cipher_square = build_square("playfair example")
puts
p encipher('TU', my_cipher_square)
p encipher('DE', my_cipher_square)
p encipher('HI', my_cipher_square)