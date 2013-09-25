class GameBoard
  attr_reader :locations_cells, :guess_cells, :number_of_hits

  def set_locations_cells(locations)
    @locations_cells = locations
    @guess_cells = []
    @number_of_hits = 0
  end

  # shorter alternative (but doesn't use number_of_hits variable)
  def check_yourself(guess)
    guess_cells << guess.to_i    
    'kill' if (locations_cells - guess_cells).size == 0
  end

  def check_yourself(guess)
    guess = guess.to_i
    if locations_cells.include?(guess) && !guess_cells.include?(guess)
      @number_of_hits += 1
    end
    guess_cells << guess
    'kill' if number_of_hits == 3
  end
end