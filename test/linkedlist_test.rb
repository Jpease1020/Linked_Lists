require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/node"
require_relative "../lib/linkedlist"

class LinkedListTest < Minitest::Test

  def test_a_new_list_has_a_nil_head
    list = LinkedList.new
    result = list.head
    assert_equal nil, result.value
  end

  def test_a_new_list_has_a_head
    list = LinkedList.new("Start")
    result = list.head
    assert_equal "Start", result.value
  end

  def test_tail_can_be_found
    list = LinkedList.new("start")
    list.append("Jeff")
    list.append("Ryan")
    list.append("Adam")
    assert_equal "Adam", list.tail.value
  end

  def test_it_appends_node_to_list
    list = LinkedList.new("start")
    list.append("Jeff")
    list.append("Ryan")
    list.append("Adam")
    list.append(5)
    assert_equal 5, list.tail.value
  end

  def test_it_can_prepend_to_beginning_of_list
    list = LinkedList.new("start")
    list.append("Jeff")
    list.append("Ryan")
    list.append("Adam")
    list.prepend("apple")
    assert_equal "apple", list.head.value
  end

  def test_it_can_insert_a_new_node_at_a_numbered_position
    list = LinkedList.new("Justin")
    list.append("Jeff")
    list.append("Ryan")
    list.append("Adam")
    list.insert(3, "Alex")
    assert_equal "Alex", list.head.pointer.pointer.value

    list.insert(4, "hello")
    assert_equal "hello", list.head.pointer.pointer.pointer.value
  end

  def test_insert_a_node_at_a_specific_value_position
    skip
    list = LinkedList.new("Sally")
    list.append("Jeff")
    list.append("Ryan")
    list.insert("Ryan", "Dave")
    assert_equal "Dave", list.head.pointer.pointer.value
    list.insert("Jeff", "Kate")
    assert_equal "Kate", list.head.pointer.pointer.pointer.value
  end

  def test_can_pop_element_from_end_of_list
    list = LinkedList.new("start")
    list.append("Jeff")
    list.append("Ryan")
    list.append("Adam")
    assert_equal "Adam", list.tail.value
    list.pop
    assert_equal "Ryan", list.tail.value
  end

  def test_can_find_if_a_specific_value_is_in_the_list
    list = LinkedList.new("Jeremy")
    list.append("Jeff")
    list.append("Ryan")
    list.append("Adam")
    assert list.include?("Jeff")
    refute list.include?("Arron")
  end

  def test_can_count_nodes
    list = LinkedList.new("Jeremy")
    list.append("Jeff")
    list.append("Ryan")
    list.append("Adam")
    assert_equal 4, list.count
  end

  def test_it_can_find_a_value_by_index
    list = LinkedList.new("Jeremy")
    list.append("Jeff")
    list.append("Ryan")
    list.append("Adam")
    assert_equal "Jeremy", list.find_by_index(1)
    assert_equal "Jeff", list.find_by_index(2)
    assert_equal "Ryan", list.find_by_index(3)
    assert_equal "Adam", list.find_by_index(4)
  end

  def test_it_can_find_the_position_of_a_given_value
    list = LinkedList.new("Jeremy")
    list.append("Jeff")
    list.append("Ryan")
    list.append("Adam")
    assert_equal 1, list.find_by_value("Jeremy")
  end

  def test_can_remove_node_by_index
    list = LinkedList.new("Bob")
    list.append("Jeff")
    list.append("Ryan")
    list.append("Adam")
    assert list.include?("Ryan")
    assert_equal 4, list.count
    list.remove_by_index(2)
    refute list.include?("Ryan")
    assert_equal 3, list.count
  end

  def test_can_remove_node_by_value
    list = LinkedList.new("Bob")
    list.append("Jeff")
    list.append("Ryan")
    list.append("Adam")
    assert list.include?("Ryan")
    list.remove_by_value("Ryan")
    refute list.include?("Ryan")
    assert_equal 3, list.count
  end
end
