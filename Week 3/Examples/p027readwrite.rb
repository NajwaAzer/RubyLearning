# p027readwrite.rb  
# Open and read from a text file  
# Note that since a block is given, file will  
# automatically be closed when the block terminates  
File.open('../../Week 2/Examples/p014constructs.rb', 'r') do |f1|  
  while line = f1.gets  
    puts line  
  end  
end  
  
# Create a new file and write to it  
File.open('test.rb', 'w') do |f2|  
  # use "\n" for two lines of text  
  f2.puts "Created by Satish\nThank God!"  
end 

require 'find'  
Find.find('./') do |f|  
  type = case  
         when File.file?(f) then "F"  
         when File.directory?(f) then "D"  
         else "?"  
         end  
  puts "#{type}: #{f}"  
end 