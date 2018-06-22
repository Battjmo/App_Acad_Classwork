require_relative "board"

class KnightPathFinder
  attr_reader :pos
  
  def initialize(pos)
    @move_tree = self.build_move_tree
    @pos = pos
  end
  
  def build_move_tree
    moves = [PolyTreeNode.new(pos)]
    changers = [-2,-1,1,2].combinations(2)
    
  end 

  











#END OF CLASS
end 