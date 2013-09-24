# Exercise1. Write a class called Dog, that has name as an instance variable and the following methods:

# bark(), eat(), chase_cat()
# I shall create the Dog object as follows:
# d = Dog.new('Leo')

# Here's an additional challenge for all of you who already finished Exercise1: Write a method teach_trick which allows you to teach tricks to specific instances of the dog class like this: 
# d = Dog.new('Lassie') 
# d.teach_trick(:dance) { "#{@name} is dancing!" } 
# puts d.dance 
# d.teach_trick(:poo) { "#{@name} is a smelly doggy!" } 
# puts d.poo 
# puts 

# d2=Dog.new('Fido') 
# puts d2.dance 
# d2.teach_trick(:laugh) { "#{@name} finds this hilarious!" } 
# puts d2.laugh 
# puts d.laugh 

# puts d3=Dog.new('Stimpy') 
# puts d3.dance 
# puts d3.laugh 

# >> Lassie is dancing! 
# >> Lassie is a smelly doggy! 
# >> 
# >> Fido doesn't know how to dance! 
# >> Fido finds this hilarious! 
# >> Lassie doesn't know how to laugh! 
# >> 
# >> Stimpy doesn't know how to dance! 
# >> Stimpy doesn't know how to laugh! 

# You will also have to deal with the fact that people may get confused and will tell a certain dog to perform a trick it hasn't learned yet...

class Dog  
  def initialize(name)  
    # Instance variable 
    @name = name 
    @tricks = {} 
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

  def teach_trick(trick_name, &trick_message)
    @tricks[trick_name] = trick_message
  end

  def tricks
    @tricks
  end

  def method_missing(m, *args, &block)
    trick = self.tricks[m.to_sym]
    trick ? trick.call : "#{@name} doesn't know how to #{m}!"
  end
end  

d = Dog.new('Lassie') 
d.teach_trick(:dance) { "#{@name} is dancing!" } 
puts d.dance 
d.teach_trick(:poo) { "#{@name} is a smelly doggy!" } 
puts d.poo 
puts 

d2=Dog.new('Fido') 
puts d2.dance 
d2.teach_trick(:laugh) { "#{@name} finds this hilarious!" } 
puts d2.laugh 
puts d.laugh 

d3=Dog.new('Stimpy') 
puts d3.dance 
puts d3.laugh 