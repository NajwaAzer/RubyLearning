h = { "Ruby" => "Matz", "Perl" => "Larry", "Python" => "Guido" }
 

puts h.member?("Matz")
puts h.member?("Python")
puts h.include?("Matz")
puts h.include?("Python")
puts h.has_value?("Matz")
puts h.has_value?("Python")
puts h.exists?("Matz")
puts h.exists?("Python")