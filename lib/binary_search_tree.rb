require './lib/node'

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(score, title)
    if @root == nil
      @root = Node.new(score, title, 0, nil)
      return @root.depth
    else
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
    max_node_return = max_node
    {max_node_return.title => max_node_return.score}
  end

  def max_node
    child = @root.right

    while child
      if child.right == nil
        return child
      end
      child = child.right
    end
  end

  def min
    min_node_return = min_node
    {min_node_return.title => min_node_return.score}
  end

  def min_node
    child = @root.left

    while child
      if child.left == nil
        return child
      end
      child = child.left
    end
  end

  def one_step_of_sort(walk, sort_ary)
    if walk.left != nil && walk.left.score > sort_ary.last.score
      walk = walk.left
    elsif walk.score >= sort_ary.last.score
      if sort_ary.last.score != walk.score
        sort_ary << walk
      end

      if walk.right != nil && walk.right.score > sort_ary.last.score
        walk = walk.right
      else
        walk = walk.parent
      end
    else # if last = walk
      walk = walk.parent
    end

    return walk, sort_ary
  end

  def sorted_nodes
    walk = min_node
    sort_ary = [walk]

    while walk != nil
      walk, sort_ary = one_step_of_sort(walk, sort_ary)
    end

    sort_ary
  end

  def sort
    sorted_nodes.map do |element|
      {element.title => element.score}
    end
  end
end
