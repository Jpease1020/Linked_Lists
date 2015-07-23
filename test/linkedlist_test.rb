require 'minitest/autorun'
require 'minitest/pride'
require_relative "../lib/node"
require_relative "../lib/linkedlist"

class LinkedListTest < Minitest::Test

  def test_a_list_must_have_a_node
    list = LinkedList.new
    refute_equal 0, list.count
  end

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

  def test_head_is_tail_in_one_node_list
    list = LinkedList.new(4)
    assert_equal list.head, list.tail
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

  def test_it_can_insert_a_new_node_at_last_position
    list = LinkedList.new("Justin")
    list.append("Jeff")
    list.append("Ryan")
    list.append("Adam")
    list.insert(5, "Alex")
    assert_equal "Alex", list.tail.value
  end

  def test_it_can_insert_a_new_node_at_first_position
    list = LinkedList.new("Justin")
    list.append("Jeff")
    list.append("Ryan")
    list.append("Adam")
    list.insert(1, "Alex")
    assert_equal "Alex", list.head.value
  end

  def test_it_will_not_allow_node_added_at_position_zero
    list = LinkedList.new("Justin")
    list.append("Jeff")
    list.append("Ryan")
    list.append("Adam")
    list.insert(0, "Alex")
    assert_equal "Justin", list.head.value
    refute list.include?("Alex")
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

  def test_pop_only_pops_the_last_node
    list = LinkedList.new("Barry")
    list.append("Jeff")
    list.append("Ryan")
    list.append("Adam")
    assert_equal "Adam", list.tail.value
    list.pop
    assert_equal "Ryan", list.tail.value
    refute_equal "Adam", list.tail.value
    assert list.include?("Jeff")
    assert list.include?("Ryan")
    assert list.include?("Barry")
  end

  def test_can_find_if_a_specific_value_is_in_the_list
    list = LinkedList.new("Jeremy")
    list.append("Jeff")
    list.append("Ryan")
    list.append("Adam")
    assert list.include?("Jeff")
    refute list.include?("Arron")
  end

  def test_can_not_find_if_a_specific_value_is_not_in_the_list
    list = LinkedList.new("Jeremy")
    list.append("Jeff")
    list.append("Ryan")
    list.append("Adam")
    refute list.include?("Arron")
  end

  def test_can_count_one_node
    list = LinkedList.new("Jeremy")
    assert_equal 1, list.count
  end

  def test_can_count_multiple_nodes
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
  end

  def test_it_can_find_multiple_values_by_index
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
    refute list.include?("Jeff")
    assert_equal 3, list.count
  end

  def test_can_remove_head_node_by_index
    list = LinkedList.new("Bob")
    list.append("Jeff")
    list.append("Ryan")
    list.append("Adam")
    assert list.include?("Ryan")
    assert_equal 4, list.count
    list.remove_by_index(1)
    refute list.include?("Bob")
    assert_equal 3, list.count
  end

  def test_can_remove_tail_node_by_index
    list = LinkedList.new("Bob")
    list.append("Jeff")
    list.append("Ryan")
    list.append("Adam")
    assert list.include?("Ryan")
    assert_equal 4, list.count
    list.remove_by_index(4)
    refute list.include?("Adam")
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

  def test_can_remove_head_node_by_value
    list = LinkedList.new("Bob")
    list.append("Jeff")
    list.append("Ryan")
    list.append("Adam")
    assert list.include?("Bob")
    list.remove_by_value("Bob")
    refute list.include?("Bob")
    assert_equal 3, list.count
  end

  def test_will_not_blow_up_if_desired_value_to_be_removed_is_not_in_list
    list = LinkedList.new("Bob")
    list.append("Jeff")
    list.append("Ryan")
    list.append("Adam")
    assert_equal 4, list.count
    list.remove_by_value("Alex")
    assert_equal 4, list.count
  end

  # def test_pop_returns_the_popped_node
  # end

  def test_can_find_the_distance_between_two_nodes
    list = LinkedList.new("Bob")
    list.append("Jeff")
    list.append("Ryan")
    list.append("Adam")
    list.append("Derek")
    list.append("Reggie")
    assert_equal 3, list.node_distance("Ryan", "Reggie")
    assert_equal 5, list.node_distance("Bob", "Reggie")
    assert_equal 3, list.node_distance("Ryan", "Reggie")
    assert_equal 2, list.node_distance("Derek", "Ryan")
    assert_equal 5, list.node_distance("Reggie", "Bob")
  end

end
