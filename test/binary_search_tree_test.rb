require 'minitest/autorun'
require './lib/binary_search_tree'

class BinarySearchTreeTest < Minitest::Test
  def test_it_exists
    tree = BinarySearchTree.new

    assert_instance_of BinarySearchTree, tree
  end
end
