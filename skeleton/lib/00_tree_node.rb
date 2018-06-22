require "byebug"

class PolyTreeNode
  
  def initialize(value)
    @value = value
    @parent = nil 
    @children = []
  end
  
  def parent
    @parent
  end
  
  def children
    @children
  end 
  
  def value
    @value
  end 
  
  def parent=(node)
    if node == nil
      @parent.children.delete(self)
      @parent = nil 
      return
    elsif @parent == nil 
      @parent = node 
      @parent.children << self unless @parent.children.include?(self) 
      return
    end 
    
    unless self.parent == node
      @parent.children.delete(self)
      @parent = node 
      @parent.children << self unless @parent.children.include?(self) 
    end
  end
  
  def add_child(child_node)
    child_node.parent = self
  end 
  
  def remove_child(child_node)
    raise "THAT'S NOT MY BABY!" unless self.children.include?(child_node)
    child_node.parent = nil
  end
  
  def dfs(target)
    return self if self.value == target
    
    self.children.each do |child|
      search_result = child.dfs(target) 
      return search_result unless search_result.nil?
    end
    nil
  end  

  def bfs(target_value)
    queue = []
    queue << self
    until queue.length == 0
      el = queue.shift
      return el if el.value == target_value
      queue += el.children
    end 
    nil
  end 
end
