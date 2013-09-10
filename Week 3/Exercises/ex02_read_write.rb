filename = '3wk_2e_text.txt'

read_file = File.open(filename, 'r')
lines = read_file.readlines
lines.each { |line| line.gsub!('word', 'inserted word') }
read_file.close


write_file = File.open(filename, 'w')
lines.each do |line|
  write_file.puts line
end
write_file.close
  