class UnpredictableString < String
  def initialize(starting_string)
    unpredictable = starting_string.split("").shuffle.join()
    super unpredictable
  end
end

puts UnpredictableString.new("It was a dark and stormy night.")