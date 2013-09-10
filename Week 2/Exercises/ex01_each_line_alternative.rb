my_string = "Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n"

my_string.lines.each_with_index do |line, line_index| 
  puts "Line #{line_index+1}: #{line}" 
end
