def fizzbuzz(stop, pairs)
  for i in 1..stop
    string_to_print = String.new
    pairs.each do |divider, matching_string| 
      string_to_print += matching_string if i % divider == 0
    end
    puts "#{i}: #{string_to_print.empty? ? i : string_to_print}"
  end
end

fizzbuzz(100, 3 => 'Fizz', 5 => 'Buzz', 7 => 'Dazz', 11 => 'Kezz')