key_phrase = "Playfair Example."
puts cipher_square = Array.new(5,Array.new(5,''))
key_phrase_cleansed = key_phrase.upcase.scan(/[A-Z]/)
 
#fill 5 X 5 array with values from key_phrase
(0..1).each do |y|
  (0..4).each do |x|
    puts letter = key_phrase_cleansed.shift
    cipher_square[y][x] = letter
    puts " cipher_square[#{y}][#{x}] = #{cipher_square[y][x]}" #cipher_square has intended values
  end
end

 
#check values of 5 X 5 array
(0..4).each do |y|
  (0..4).each do |x|
    puts " cipher_square[#{y}][#{x}] = #{cipher_square[y][x]}" #why is cipher_square empty now???
  end
end
 
p cipher_square #why is the entire cipher_square array empty?