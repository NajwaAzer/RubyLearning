# http://dl.dropboxusercontent.com/u/10654169/Playfair_Instructions.pdf

class PlayfairCipher
  attr_reader :square

  def initialize(key)
    @square = build_square(key)
  end

  def encrypt(message)
    process(message, "encipher")
  end

  def decrypt(message)
    process(message, "decipher")
  end

  private

    def build_square(key)
      # change J to I
      phrase = phrase.gsub('J', 'I')
      # keep only letters
      letters = key.upcase.gsub(/[^A-Z]/, '').chars.uniq

      # determine which letters to add
      alphabet = ('A'..'Z').to_a
      alphabet -= ['J']
      remaining_letters = alphabet - letters
      keyphrase_letters = letters + remaining_letters

      # create cipher square
      square = Array.new(5) { Array.new(5,true) }
      square.each do |row|
        row.map! { |cell| keyphrase_letters.shift }
      end
    end

    def process(message, process_type)
      message = preprocess(message, process_type)
      message.map! { |digraph| process_pair(digraph, process_type).join() }
      message.join
    end

    def preprocess(message, process_type)
      if process_type == "encipher"
        # convert to upper case and strip non-letters
        letter_array = message.upcase.gsub(/[^A-Z]/, '').chars
        # insert letters where needed
        insert_letters(letter_array) 
      end
      
      # create a new array with digraphs
      new_message = []
      letter_array.each_slice(2) do |first, second| 
        new_message << [first, second]
      end
      new_message
    end

    def insert_letters(letter_array)
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
    end

    def process_pair(digraph, process_type)
      # replace letters with current location
      digraph = locate_pair(digraph)

      # replace current with new location
      if same_row(digraph)
        if process_type == "encipher"
          digraph[0][1] == 4 ? digraph[0][1] = 0 : digraph[0][1] += 1
          digraph[1][1] == 4 ? digraph[1][1] = 0 : digraph[1][1] += 1
        else
          digraph[0][1] == 0 ? digraph[0][1] = 0 : digraph[0][1] -= 1
          digraph[1][1] == 0 ? digraph[1][1] = 0 : digraph[1][1] -= 1
        end
      elsif same_column(digraph)
        if process_type == "encipher"
          digraph[0][0] == 4 ? digraph[0][0] = 0 : digraph[0][0] += 1
          digraph[1][0] == 4 ? digraph[1][0] = 0 : digraph[1][0] += 1
        else
          digraph[0][0] == 0 ? digraph[0][0] = 0 : digraph[0][0] -= 1
          digraph[1][0] == 0 ? digraph[1][0] = 0 : digraph[1][0] -= 1
        end
      else # corners of a rectangle
        digraph[0][1] , digraph[1][1] = digraph[1][1] , digraph[0][1]
      end

      # replace new location with new letter
      new_pair(digraph)
    end

    def locate_pair(digraph)
      digraph.each_with_index do |letter, letter_number| 
        square.each_with_index do |row, row_number|
          if row.index(letter)  
            digraph[letter_number] = [row_number, row.index(letter)]
          end
        end   
      end
    end

    def same_row(digraph)
     digraph[0][0] == digraph[1][0] # same row
    end

    def same_column(digraph)
      digraph[0][1] == digraph[1][1] # same column
    end

    def new_pair(digraph)
      digraph.map! do |letter_location|
          square[letter_location[0]][letter_location[1]]
      end

      # convert array to a letter pair (eg. ['U', 'V'] --> "UV")
      # digraph.join
    end
end    

key = 'Playfair Example.'
input_message = 'Hide the gold in the tree stump'
pc = PlayfairCipher.new key

p estr = pc.encrypt(input_message) #=> "BMODZBXDNABEKUDMUIXMMOUVIF"
p pc.decrypt(estr) #=> "HIDETHEGOLDINTHETREXESTUMP"

require 'pp'
pp pc.square

p test = PlayfairCipher.new("First Amendment").encrypt("Congress shall make no law respecting an establishment of religion, or prohibiting the free exercise thereof; or abridging the freedom of speech, or of the press; or the right of the people peaceably to assemble, and to petition the government for a redress of grievances.")
#=> "OWEHEGRYTYNQBVOADBNDPOMVEGRQMGFREHMDNRFDLVRTCNNDIUISAPRCMWMQEXIPCSCFFREHSKAREGGRGRGEOMRNSKGEMPILFEGFTMCREHSKAREGNAWCLIRQGRMGCQIPIFGNXENRIQSFGNSRHKIUIFGNXGPQPAXGMBNMLVZSLMRYRNACPAMDKDPQDRRFMWDSGNCPXASEENDSILFEEGETNRIQRBSRAXMDGMRY"