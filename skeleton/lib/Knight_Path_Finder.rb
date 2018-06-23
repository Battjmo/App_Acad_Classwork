
require_relative "00_tree_node"

class KnightPathFinder
  attr_reader :pos
  
  def initialize(pos)
    @pos = pos
    @visited_positions = [@pos]
    @move_tree = self.build_move_tree
  end
  
  def self.valid_moves(pos)
    moves = []
    changers = [[1,2], [2,1], [-1,-2], [-2,-1], [-2,1], [1,-2], [-1,2], [2,-1]]
    changers.each do |move|
      current_move = [(move[0] + pos[0]), (move[1] + pos[1])]
      moves << current_move if valid_move?(current_move)
    end 
    moves
  end 
    
  def valid_move?(pos)
    pos.each do |idx|
      return false if idx < 0 || idx > 7
    end 
    true        
  end 
  
  def new_move_positions(pos)
    new_moves = KnightPathFinder.valid_moves(pos)
    new_moves.select {|move| !@visited_positions.include?(move)}
    @visited_positions += new_moves 
    new_moves
  end
  
  def build_move_tree
    queue = [PolyTreeNode.new(@pos)]
    tree = []
    until queue.empty?
      parent = queue.shift
      pos = parent.value
      tree << parent
      new_move_positions(pos).each do |pos|
        new_child = PolyTreeNode.new(pos)
        queue << new_child
        parent.add_child(new_child)
      end 
    end 
    tree << queue
  end 
#END OF CLASS
end 