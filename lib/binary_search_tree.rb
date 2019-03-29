require './lib/node'

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(score, title)
    if @root == nil
      @root = Node.new(score, title, 0)
      return @root.depth
    end

    parent = @root
    while parent
      depth = parent.depth + 1

      if score < parent.score
        if parent.left == nil
          parent.left = Node.new(score, title, depth)
          return depth
        end

        parent = parent.left

      else # score > parent.score *(or equal)*
        if parent.right == nil
          parent.right = Node.new(score, title, depth)
          return depth
        end

        parent = parent.right
      end
    end
  end
end
