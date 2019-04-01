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

  def test_max_returns_hash_with_title_and_max_score
    tree = BinarySearchTree.new

    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    expected = {"Sharknado 3" => 92}

    assert_equal expected, tree.max
  end

  def test_max_node_returns_node_with_max_score
    tree = BinarySearchTree.new

    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 92, tree.max_node.score
    assert_equal "Sharknado 3", tree.max_node.title
  end

  def test_min_returns_hash_with_title_and_min_score
    tree = BinarySearchTree.new

    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    expected = {"Johnny English" => 16}

    assert_equal expected, tree.min
  end

  def test_min_node_returns_node_with_min_score
    tree = BinarySearchTree.new

    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 16, tree.min_node.score
    assert_equal "Johnny English", tree.min_node.title
  end

  def test_first_step_of_sort
    tree = BinarySearchTree.new
    bill = Node.new(61, "Bill & Ted's Excellent Adventure", 0, nil)
    johnny = Node.new(16, "Johnny English", 1, bill)
    bill.left = johnny
    shark = Node.new(92, "Sharknado 3", 1, bill)
    bill.right = shark
    hannibal = Node.new(50, "Hannibal Buress: Animal Furnace", 2, johnny)
    johnny.right = hannibal

    actual_node, actual_sort_ary = tree.one_step_of_sort(johnny, [johnny])

    assert_equal hannibal, actual_node
    assert_equal [johnny], actual_sort_ary
  end

  def test_second_step_of_sort
    tree = BinarySearchTree.new
    bill = Node.new(61, "Bill & Ted's Excellent Adventure", 0, nil)
    johnny = Node.new(16, "Johnny English", 1, bill)
    bill.left = johnny
    shark = Node.new(92, "Sharknado 3", 1, bill)
    bill.right = shark
    hannibal = Node.new(50, "Hannibal Buress: Animal Furnace", 2, johnny)
    johnny.right = hannibal

    actual_node, actual_sort_ary = tree.one_step_of_sort(hannibal, [johnny])

    assert_equal johnny, actual_node
    assert_equal [johnny, hannibal], actual_sort_ary
  end

  def test_third_step_of_sort
    tree = BinarySearchTree.new
    bill = Node.new(61, "Bill & Ted's Excellent Adventure", 0, nil)
    johnny = Node.new(16, "Johnny English", 1, bill)
    bill.left = johnny
    shark = Node.new(92, "Sharknado 3", 1, bill)
    bill.right = shark
    hannibal = Node.new(50, "Hannibal Buress: Animal Furnace", 2, johnny)
    johnny.right = hannibal

    actual_node, actual_sort_ary = tree.one_step_of_sort(johnny, [johnny, hannibal])

    assert_equal bill, actual_node
    assert_equal [johnny, hannibal], actual_sort_ary
  end

  def test_fourth_step_of_sort
    tree = BinarySearchTree.new
    bill = Node.new(61, "Bill & Ted's Excellent Adventure", 0, nil)
    johnny = Node.new(16, "Johnny English", 1, bill)
    bill.left = johnny
    shark = Node.new(92, "Sharknado 3", 1, bill)
    bill.right = shark
    hannibal = Node.new(50, "Hannibal Buress: Animal Furnace", 2, johnny)
    johnny.right = hannibal

    actual_node, actual_sort_ary = tree.one_step_of_sort(bill, [johnny, hannibal])

    assert_equal shark, actual_node
    assert_equal [johnny, hannibal, bill], actual_sort_ary
  end

  def test_fifth_step_of_sort
    tree = BinarySearchTree.new
    bill = Node.new(61, "Bill & Ted's Excellent Adventure", 0, nil)
    johnny = Node.new(16, "Johnny English", 1, bill)
    bill.left = johnny
    shark = Node.new(92, "Sharknado 3", 1, bill)
    bill.right = shark
    hannibal = Node.new(50, "Hannibal Buress: Animal Furnace", 2, johnny)
    johnny.right = hannibal

    actual_node, actual_sort_ary = tree.one_step_of_sort(shark, [johnny, hannibal, bill])

    assert_equal bill, actual_node
    assert_equal [johnny, hannibal, bill, shark], actual_sort_ary
  end

  def test_sixth_step_of_sort
    tree = BinarySearchTree.new
    bill = Node.new(61, "Bill & Ted's Excellent Adventure", 0, nil)
    johnny = Node.new(16, "Johnny English", 1, bill)
    bill.left = johnny
    shark = Node.new(92, "Sharknado 3", 1, bill)
    bill.right = shark
    hannibal = Node.new(50, "Hannibal Buress: Animal Furnace", 2, johnny)
    johnny.right = hannibal

    actual_node, actual_sort_ary = tree.one_step_of_sort(bill, [johnny, hannibal, bill, shark])

    assert_nil actual_node
    assert_equal [johnny, hannibal, bill, shark], actual_sort_ary
  end

  def test_sorted_nodes_returns_ary_of_sorted_nodes
    tree = BinarySearchTree.new

    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    actual = tree.sorted_nodes.map do |node|
      node.score
    end

    expected = [16, 50, 61, 92]

    assert_equal expected, actual
    assert_instance_of Node, tree.sorted_nodes[0]
  end

  def test_sort_returns_ary_of_sorted_hashes_with_title_and_score
    tree = BinarySearchTree.new

    tree.insert(61, "Bill & Ted's Excellent Adventure")
    tree.insert(16, "Johnny English")
    tree.insert(92, "Sharknado 3")
    tree.insert(50, "Hannibal Buress: Animal Furnace")

    expected = [{"Johnny English" => 16}, {"Hannibal Buress: Animal Furnace" => 50}, {"Bill & Ted's Excellent Adventure" => 61}, {"Sharknado 3" => 92}]

    assert_equal expected, tree.sort
  end
end
