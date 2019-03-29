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

  def test_search_returns_title_given_score_in_tree
    tree = BinarySearchTree.new

    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal "Bill & Ted's Excellent Adventure", tree.search(61).title
    assert_equal "Johnny English", tree.search(16).title
    assert_equal "Sharknado 3", tree.search(92).title
    assert_equal "Hannibal Buress: Animal Furnace", tree.search(50).title
    assert_nil tree.search(54)
  end

  def test_include_checks_if_score_is_included_in_the_tree
    tree = BinarySearchTree.new

    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal true, tree.include?(16)
    assert_equal false, tree.include?(72)
  end

  def test_depth_of_returns_depth_given_score
    tree = BinarySearchTree.new

    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 1, tree.depth_of(92)
    assert_equal 2, tree.depth_of(50)
  end

  def test_max_returns_max_score_in_tree
    tree = BinarySearchTree.new

    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    expected = {"Sharknado 3" => 92}

    assert_equal expected, tree.max
  end
end
