require 'minitest/autorun'
require './lib/node'

class NodeTest < Minitest::Test
  def test_it_exists
    node = Node.new(61, "Bill & Ted's Excellent Adventure", 0, nil)

    assert_instance_of Node, node
  end

  def test_it_inits_with_score_title_depth_and_parent
    parent = Node.new(92, "Sharknado 3", 6, nil)
    node = Node.new(61, "Bill & Ted's Excellent Adventure", 5, parent)

    assert_equal 61, node.score
    assert_equal "Bill & Ted's Excellent Adventure", node.title
    assert_equal 5, node.depth
    assert_equal parent, node.parent
    assert_nil parent.parent
  end

  def test_it_inits_with_no_children
    node = Node.new(61, "Bill & Ted's Excellent Adventure", 5, nil)

    assert_nil node.right
    assert_nil node.left
  end

  def test_its_children_can_be_changed
    node = Node.new(61, "Bill & Ted's Excellent Adventure", 5, nil)

    right_child = Node.new(92, "Sharknado 3", 6, node)
    node.right = right_child

    left_child = Node.new(16, "Johnny English", 6, node)
    node.left = left_child

    assert_equal right_child, node.right
    assert_equal left_child, node.left
  end
end
