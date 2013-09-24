filename = '3wk_2e_text.txt'

new_lines = File.readlines(filename).each do 
  |line| line.gsub!('word', 'inserted word') 
end

File.open(filename, 'w') do |write_file|
   write_file.puts new_lines
end