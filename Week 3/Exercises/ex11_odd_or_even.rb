def odd_or_even(collection)
  collection.each do |number|
    status = "odd"  if number%2 != 0
    status = "even" if number%2 == 0
    puts "#{number} is #{status}"
  end
end

collection = [12, 23, 456, 123, 4579]
odd_or_even(collection)
