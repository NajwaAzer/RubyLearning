def g *args # The splat here says accept 1 or more arguments, in the form of an Array  
  args      # This returns an array  
end  
  
def f arg  
  arg  
end  
  
x,y,z = [true, 'two', false] # parallel assignment lets us do this  

if a = f(x) and b = f(y) and c = f(z) then  
  d = g(a,b,c) # An array is returned, and stored in variable d  
end  
  
if l = f(x) && m = f(y) && n = f(z) then  
  e = g(l,m,n) # An array is returned, and stored in variable e  
end 

puts "a,b,c,d"
puts a, b, c
p d
puts "\nl,m,n,e"
puts l, m, n
p e