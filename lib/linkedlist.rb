require_relative './node'
require 'pry'
class LinkedList

  attr_accessor :head, :index
  def initialize(value = nil)
    @head = Node.new(value)
  end

  def tail
    temp = @head
    until temp.pointer == nil
      temp = temp.pointer
    end
    temp
  end

  def append(value)
    tail.pointer = Node.new(value)
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def insert(position, value)
    if position > count + 1
      puts "can't do that"
      return
    end
    temp = @head
    index = 1
    if position == 1
      prepend(value)
      return
    end
    until index == position - 1
      index += 1
      temp = temp.pointer
    end
      temp_pointer = temp.pointer
      temp.pointer = Node.new(value, temp_pointer)
  end

  def pop
    temp = @head
    until temp.pointer == tail
      temp = temp.pointer
    end
    temp.pointer = nil
  end

  def include?(search_value)
    temp = @head
    until temp.value == search_value || temp.pointer.nil?
      temp = temp.pointer
    end
    if temp.value == search_value
      true
    else
      false
    end
  end

  def count
    temp = @head
    index = 1
    until temp.pointer == nil
      temp = temp.pointer
      index += 1
    end
    index
  end

  def find_by_index(index)
    temp = @head
    counter = 1
    until counter == index
      counter += 1
      temp = temp.pointer
    end
      temp.value
  end

  def find_by_value(search_value)
    temp = @head
    counter = 1
    until temp.value == search_value
      counter += 1
      temp = temp.pointer
    end
      counter
  end

  def remove_by_index(index)
    if index == 0
      @head = head.pointer
      return
    end
    temp = @head
    counter = 0
    until counter == index - 1
      temp = temp.pointer
      counter += 1
    end
    temp.pointer = temp.pointer.pointer
  end

  def remove_by_value(value)
    temp = @head
    counter = 1
    until temp.pointer.value == value
      temp = temp.pointer
      counter += 1
    end
    temp.pointer = temp.pointer.pointer
  end

end
