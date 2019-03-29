class Node
  attr_reader :score, :title, :depth
  attr_accessor :right, :left

  def initialize(score, title, depth)
    @score = score
    @title = title
    @depth = depth
  end
end
