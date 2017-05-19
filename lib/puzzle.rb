class Puzzle
  attr_accessor :grid, :zero_position

  def initialize(string)
    @grid = string
    @zero_position = string.index("0")
  end

  def print_puzzle
    print "-------\n"
    (1..9).each do |h|
      print "|#{@grid[h - 1]}"
      print "|\n" if h % 3 == 0
    end
    print "-------\n"
  end

  def move_up
    if @zero_position / 3 > 0
      swap_position(@zero_position, @zero_position - 3)
      @zero_position = @zero_position - 3
      return true
    end
    return false
  end

  def move_down
    if @zero_position / 3 < 2
      swap_position(@zero_position, @zero_position + 3)
      @zero_position = @zero_position + 3
      return true
    end
    return false
  end

  def move_right
    if @zero_position % 3 < 2
      swap_position(@zero_position, @zero_position + 1)
      @zero_position = @zero_position + 1
      return true
    end
    return false
  end

  def move_left
    if @zero_position % 3 > 0
      swap_position(@zero_position, @zero_position - 1)
      @zero_position = @zero_position - 1
      return true
    end
    return false
  end

  def swap_position(l, r)
    temp = @grid[l]
    @grid[l] = @grid[r]
    @grid[r] = temp
  end

  def complete?
    if @grid == "123456780"
      print "\nSolution Found\n"
      return true
    end
  end
end
