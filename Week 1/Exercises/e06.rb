=begin
Write a method called convert that takes one argument which is a temperature in degrees Fahrenheit. This method should return the temperature in degrees Celsius.

To format the output to say 2 decimal places, we can use the Kernel's format method. For example, if x = 45.5678 then format("%.2f", x) will return the string 45.57. Another way is to use the round function as follows:

puts (x*100).round/100.0
=end

puts 'What\'s the temperature in Fahrenheit?'
t_in_fahrenheit = gets.chomp
until !t_in_fahrenheit.empty?
  puts 'Please enter a number'
  t_in_fahrenheit = gets.chomp
end
t_in_celsius = format("%.2f", (t_in_fahrenheit.to_f - 32) / 1.8)
puts "#{t_in_fahrenheit} degrees Fahrenheit is #{t_in_celsius} degrees Celsius."
