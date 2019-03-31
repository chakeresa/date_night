require './lib/node'

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(score, title)
    if @root == nil
      @root = Node.new(score, title, 0, nil)
      return @root.depth
    end

    parent = @root
    while parent
      depth = parent.depth + 1

      if score < parent.score
        if parent.left == nil
          parent.left = Node.new(score, title, depth, parent)
          return depth
        end

        parent = parent.left

      else # score > parent.score *(or equal)*
        if parent.right == nil
          parent.right = Node.new(score, title, depth, parent)
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
    return search(score) != nil
  end

  def depth_of(score)
    search(score).depth
  end

  def max
    child = @root.right

    while child
      if child.right == nil
        @max_node = child
        return {child.title => child.score}
      end
      child = child.right
    end
  end

  def min
    child = @root.left

    while child
      if child.left == nil
        @min_node = child
        return {child.title => child.score}
      end
      child = child.left
    end
  end

  def sort
    min
    walk = @min_node
    sort_ary = [walk]
    while walk != nil
      # TO DO: fix infinite loop
      if walk.left != nil && walk.left.score < sort_ary.last.score
        walk = walk.left
      elsif walk.score > sort_ary.last.score
        sort_ary << walk
        if walk.right != nil && walk.right.score > sort_ary.last.score
          walk = walk.right
        else
          walk = walk.parent
        end
      end
    end

    sort_ary.map do |element|
      {element.title => element.score}
    end
  end
end
