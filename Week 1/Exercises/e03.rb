=begin
 Write a Ruby program that displays how old I am, if I am 979000000 seconds old. Display the result as a floating point (decimal) number to two decimal places (for example, 17.23). Note: To format the output to say 2 decimal places, we can use the Kernel's format method. For example, if x = 45.5678 then format("%.2f", x) will return the string 45.57 
=end

age_in_seconds = 979_000_000
seconds_in_a_year = 365 * 24 * 60 * 60
age_in_years = age_in_seconds / seconds_in_a_year.to_f

puts "You are #{format("%.2f", age_in_years)} years old."