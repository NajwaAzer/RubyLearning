first_file  = 'file_a.txt'
second_file = 'file_b.txt'
temp_file   = 'temp.txt'

File.open(first_file, 'r') do |copy|  
  File.open(temp_file, 'w') do |paste|
    while line = copy.gets  
      puts paste.puts line
    end  
  end 
end

File.open(second_file, 'r') do |copy|  
  File.open(first_file, 'w') do |paste|
     while line = copy.gets  
      puts paste.puts line
    end  
  end 
end

File.open(temp_file, 'r') do |copy|  
  File.open(second_file, 'w') do |paste|
    while line = copy.gets  
      puts paste.puts line
    end  
  end 
end

File.delete(temp_file)