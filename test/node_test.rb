require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/node'

  class NodeTest < Minitest::Test

  def test_nil_node
    node1 = Node.new
    assert_equal nil, node1.value
    assert_equal nil, node1.pointer
  end

  def test_non_nil_node
    node1 = Node.new(7)
    assert_equal 7, node1.value
    assert_equal nil, node1.pointer
  end

  def test_node_knows_next_node
    node2 = Node.new("Justin")
    node1 = Node.new(7, node2)
    assert_equal 7, node1.value
    assert_equal "Justin", node1.pointer.value
  end

  def test_node_knows_next_node
    node1 = Node.new(7, Node.new(8, Node.new("Hi")))
    assert_equal 7, node1.value
    assert_equal "Hi", node1.pointer.pointer.value
  end
end
