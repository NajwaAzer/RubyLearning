=begin
Write a program that processes the string s = "Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n" a line at a time, using all that we have learned so far. 
=end

s = "Welcome to the forum.\nHere you can learn Ruby.\nAlong with other members.\n"

i = 0;
s.each_line do |c| 
  i += 1
  puts "Line #{i}: #{c}"
end