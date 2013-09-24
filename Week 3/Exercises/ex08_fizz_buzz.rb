def fizzbuzz(number, rules={3 => 'Fizz', 5 => 'Buzz'})
  result = String.new
  rules.each do |divider, matching_string| 
    result += matching_string if number % divider == 0
  end
  result.empty? ? number : result
end

my_rules = {3 => 'Fizz', 5 => 'Buzz', 7 => 'Dazz', 11 => 'Kezz'} 

(1..100).each do |i|
  puts "#{i}: #{fizzbuzz(i, my_rules)}"
end