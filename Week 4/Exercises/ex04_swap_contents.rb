first_file  = 'file_a.txt'
second_file = 'file_b.txt'

first_file_contents = File.readlines(first_file)
second_file_contents = File.readlines(second_file)

File.open(second_file, 'w') do |file|
   file.puts first_file_contents
end

File.open(first_file, 'w') do |file|
   file.puts second_file_contents
end