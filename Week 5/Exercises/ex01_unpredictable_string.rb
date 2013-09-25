class UnpredictableString < String
  def scramble
    self.split("").shuffle.join()
  end
end

puts UnpredictableString.new("It was a dark and stormy night.").scramble