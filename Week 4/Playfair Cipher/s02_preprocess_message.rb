def preprocess(message)
  # convert to upper case and strip non-letters
  message.upcase!.gsub!(/[^A-Z]/, '')
  letter_array = message.chars

  # insert letters where needed
  insert_array = ['X', 'Z'] # Z is used if letter shows up >twice in a row
  last_insert = letter_array.length # to check how many times in a row
  insert_count = 0 # used to determine whether an X or Z is to be inserted
  
  letter_array.each_with_index do |letter, index|
    # look at second letter in pair and compare it to first letter
    if index.odd? && letter == letter_array[index-1]
      if index - last_insert == 2
        insert_count += 1
      else
        insert_count = 0
      end
      letter_to_insert = insert_array[insert_count % 2]
      letter_array.insert(index, letter_to_insert)
      last_insert = index
    end
  end
  
  # pad with a final X if needed
  letter_array << 'X' if letter_array.length.odd?
  
  # create a new array with digraphs
  new_message = []
  letter_array.each_slice(2) do |first, second| 
    new_message << [first, second]
  end

  # print digraphs, one on each line
  new_message.each do |row|
    print row.join
  end

  puts
  new_message
end

my_preprocessed_message = preprocess("Hide the gold in the tree stump")
p my_preprocessed_message