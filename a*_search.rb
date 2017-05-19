## Find the most optimal solution using A*
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
require 'pqueue'

class Node
  attr_accessor :manhattan_distance
end

puzzle = Puzzle.new("761250843")
starting_node = Node.new(puzzle.grid, 0)
starting_node.manhattan_distance = puzzle.manhattan_distance

print "Starting...\n"

puzzle.print_results {
  counter = 0
  generated = [puzzle.grid]
  solutions = PQueue.new([starting_node]) { |a,b| a.manhattan_distance < b.manhattan_distance }
  completed_node = nil

  until solutions.length == 0 || completed_node do
    current_node = solutions.pop

    directions = [:move_up, :move_right, :move_down, :move_left]

    directions.each do |direction|
      puzzle = Puzzle.new(current_node.data.dup)
      if puzzle.send(direction) && !generated.include?(puzzle.grid)
        new_node = Node.new(puzzle.grid, current_node.depth + 1, current_node)
        new_node.manhattan_distance = puzzle.manhattan_distance + current_node.depth
        current_node.children << current_node # redundent... but ya know...
        solutions.push new_node
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
