filename = 'text.txt'

lines = File.readlines(filename)
text = lines.join

count_of_lines = lines.size
count_of_characters = text.length
count_of_characters_no_white_space = text.gsub(/\s+/, "").length
count_of_words = text.split(" ").length
count_of_sentences = text.split(/\.|\?|\!/).length
count_of_paragraphs = text.split(/\r\n\r\n/).length 

puts "Lines: #{count_of_lines}"
puts "Characters: #{count_of_characters}"
puts "Characters, no white spaces: #{count_of_characters_no_white_space}"
puts "Words: #{count_of_words}"
puts "Sentences: #{count_of_sentences}"
puts "Paragraphs: #{count_of_paragraphs}"
puts "Words per sentence: #{count_of_words/count_of_sentences}"
puts "Sentences per paragraph: #{count_of_sentences/count_of_paragraphs}"
