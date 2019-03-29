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

  def search(score)
    parent = @root
    while parent
      if score == parent.score
        return parent
      elsif score < parent.score
        return nil if parent.left == nil
        parent = parent.left
      else # score > parent.score
        return nil if parent.right == nil
        parent = parent.right
      end
    end
  end

  def include?(score)
    # is there a more elegant way?
    if search(score)
      return true
    else
      return false
    end
  end

  def depth_of(score)
    search(score).depth
  end

  def max
    child = @root.right

    while child
      if child.right == nil
        return {child.title => child.score}
      end
      child = child.right
    end
  end
end
