def sum_array_elements(collection)
  puts collection.inject {|sum, element| sum+element}
end

collection = [1, 2, 3, 4, 5]
sum_array_elements(collection)
