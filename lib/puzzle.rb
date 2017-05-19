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

  def print_results
    counter, completed_node = yield

    print "Took #{counter} iterations\n"

    print "Calculating path\n"

    stack_to_parent = []
    current_node = completed_node

    while current_node != nil do
      stack_to_parent << current_node
      current_node = current_node.parent
    end

    steps = stack_to_parent.length

    while stack_to_parent.length > 0 do
      Puzzle.new(stack_to_parent.pop.data).print_puzzle
    end

    print "Steps to get path: #{steps}\n"
  end

  def manhattan_distance
    total = 0
    @grid.split('').each do |item|
      total += minimum_moves(item)
    end

    total
  end

  private
    def minimum_moves(item)
      return 0 if item == '0'
      start = @grid.index(item)
      finish = item.to_i - 1

      vertical = ((start / 3) - (finish / 3)).abs
      horizontal = ((start % 3) - (finish % 3)).abs
      vertical + horizontal
    end
end
