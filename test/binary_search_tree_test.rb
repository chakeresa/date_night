require 'minitest/autorun'
require './lib/binary_search_tree'

class BinarySearchTreeTest < Minitest::Test
  def test_it_exists
    tree = BinarySearchTree.new

    assert_instance_of BinarySearchTree, tree
  end

  def test_insert_returns_depth_of_new_node
    tree = BinarySearchTree.new

    actual1 = tree.insert(61, "Bill & Ted's Excellent Adventure")
    actual2 = tree.insert(16, "Johnny English")
    actual3 = tree.insert(92, "Sharknado 3")
    actual4 = tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 0, actual1
    assert_equal 1, actual2
    assert_equal 1, actual3
    assert_equal 2, actual4
  end
end
