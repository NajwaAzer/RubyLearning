# Exercise1. Write a class called Dog, that has name as an instance variable and the following methods:

# bark(), eat(), chase_cat()
# I shall create the Dog object as follows:
# d = Dog.new('Leo')

class Dog  
  def initialize(name)  
    # Instance variable 
    @name = name 
  end  
  
  def bark
    puts 'Woof! Woof!'  
  end  
  
  def eat
    puts "Yum! Yum!"  
  end
  
  def chase_cat
    puts "Arf! Arf!"  
  end    
end  

leo = Dog.new("Leo")
leo.bark
leo.eat
leo.chase_cat