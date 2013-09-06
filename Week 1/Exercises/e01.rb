y = false
z = true
x = y or z
puts x  #false
(x = y) or z
puts x  #same as above, so false
x = (y or z)
puts x  #true
x = y || z
puts x  #true
(x = y) || z
puts x  #false
x = (y || z)
puts x  #true