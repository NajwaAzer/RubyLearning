class GameBoard
  attr_reader :locations_cells

  def set_locations_cells(locations)
    @locations_cells = locations
  end

  def check_yourself(guess)
    guess = guess.to_i
    locations_cells.include?(guess) && puts("HIT")
    locations_cells.delete(guess) || puts("MISS")
    if locations_cells.size.zero?
      puts 'END'
      return 'kill'
    end 
  end
end
