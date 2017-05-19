## Find the most optimal solution using BFS
# Hard
# starting_node = Node.new("835416270", 0)
# Med
# starting_node = Node.new("813402765", 0)
# Easy
# starting_node = Node.new("013425786", 0)
# Small
# starting_node = Node.new("364278510", 0)

require_relative 'lib/puzzle'
require_relative 'lib/node'

starting_node = Node.new("761250843", 0)
puzzle = Puzzle.new(starting_node.data)
print "Starting...\n"
puzzle.print_puzzle

puzzle.print_results {
  counter = 0
  generated = [puzzle.grid]
  solutions = [starting_node]
  completed_node = nil

  until solutions.length == 0 || completed_node do
    current_node = solutions.shift

    # if over 26 it's unsolvable
    if current_node.depth > 26
      next
    end

    directions = [:move_up, :move_right, :move_down, :move_left]

    directions.each do |direction|
      puzzle = Puzzle.new(current_node.data.dup)
      if puzzle.send(direction) && !generated.include?(puzzle.grid)
        new_node = Node.new(puzzle.grid, current_node.depth + 1, current_node)
        current_node.children << current_node # redundent... but ya know...
        solutions << new_node
        generated << puzzle.grid
        if puzzle.complete?
          completed_node = new_node
          break
        end
      end
    end

    counter = counter + 1
  end

  [counter, completed_node]
}
