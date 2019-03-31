class Node
  # include Comparable

  attr_reader :score, :title, :depth, :parent
  attr_accessor :right, :left

  def initialize(score, title, depth, parent)
    @score = score
    @title = title
    @depth = depth
    @parent = parent
  end
  #
  # def <=>(other)
  #   score <=> other.score
  # end
end
