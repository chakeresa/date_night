require 'minitest/autorun'
require './lib/node'

class NodeTest < Minitest::Test
  def test_it_exists
    node = Node.new(61, "Bill & Ted's Excellent Adventure")

    assert_instance_of Node, node
  end

  def test_it_inits_with_score_and_title
    node = Node.new(61, "Bill & Ted's Excellent Adventure")

    assert_equal 61, node.score
    assert_equal "Bill & Ted's Excellent Adventure", node.title
  end
end
