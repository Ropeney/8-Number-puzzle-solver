class Node
  attr_accessor :children, :parent, :data, :depth

  def initialize(grid, depth, parent=nil)
    @parent = parent
    @data = grid
    @depth = depth
    @children = []
  end
end
