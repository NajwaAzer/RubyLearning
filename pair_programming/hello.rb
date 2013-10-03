=begin
doctest: I can greet the world
>> hello
=> 'Hello World!'
doctest: I can greet someone by name
>> hello 'Najwa'
=> 'Hello Najwa!'
doctest: I can ask if someone is there
>> hello('Victor', '?')
=> 'Hello Victor?'
=end

def hello(name='World', punctuation='!')
  "Hello #{name}#{punctuation}"
end
