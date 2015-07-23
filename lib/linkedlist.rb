require_relative './node'  # => true
require 'pry'              # => true
class LinkedList

  attr_accessor :head, :index  # => nil
  def initialize(value = nil)
    @head = Node.new(value)    # => #<Node:0x007fbaeb1dcdd0 @value="Bob", @pointer=nil>
  end                          # => :initialize

  def position
  end

  def tail
    temp = @head               # => #<Node:0x007fbaeb1dcdd0 @value="Bob", @pointer=nil>, #<Node:0x007fbaeb1dcdd0 @value="Bob", @pointer=#<Node:0x007fbaeb1d7f38 @value="Jeff", @pointer=nil>>, #<Node:0x007fbaeb1dcdd0 @value="Bob", @pointer=#<Node:0x007fbaeb1d7f38 @value="Jeff", @pointer=#<Node:0x007fbaeb1d63e0 @value="Ryan", @pointer=nil>>>
    until temp.pointer == nil  # => true, false, true, false, false, true
      temp = temp.pointer      # => #<Node:0x007fbaeb1d7f38 @value="Jeff", @pointer=nil>, #<Node:0x007fbaeb1d7f38 @value="Jeff", @pointer=#<Node:0x007fbaeb1d63e0 @value="Ryan", @pointer=nil>>, #<Node:0x007fbaeb1d63e0 @value="Ryan", @pointer=nil>
    end                        # => nil, nil, nil
    temp                       # => #<Node:0x007fbaeb1dcdd0 @value="Bob", @pointer=nil>, #<Node:0x007fbaeb1d7f38 @value="Jeff", @pointer=nil>, #<Node:0x007fbaeb1d63e0 @value="Ryan", @pointer=nil>
  end                          # => :tail

  def append(value)
    tail.pointer = Node.new(value)  # => #<Node:0x007fbaeb1d7f38 @value="Jeff", @pointer=nil>, #<Node:0x007fbaeb1d63e0 @value="Ryan", @pointer=nil>, #<Node:0x007fbaeb1d45b8 @value="Adam", @pointer=nil>
  end                               # => :append

  def prepend(value)
    @head = Node.new(value, @head)
  end                               # => :prepend

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
  end                                               # => :insert

  def pop
    temp = @head
    until temp.pointer == tail
      temp = temp.pointer
    end
    temp.pointer = nil
  end                           # => :pop

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
  end                                                      # => :include?

  def count
    temp = @head
    index = 1
    until temp.pointer == nil
      temp = temp.pointer
      index += 1
    end
    index
  end                          # => :count

  def find_by_index(index)
    temp = @head
    counter = 1
    until counter == index
      counter += 1
      temp = temp.pointer
    end
      temp.value
  end                       # => :find_by_index

  def find_by_value(search_value)
    temp = @head
    counter = 1
    until temp.value == search_value
      counter += 1
      temp = temp.pointer
    end
      counter
  end                                 # => :find_by_value

  def remove_by_index(index)
    if index == 1                        # => false
      @head = head.pointer
      return
    end
    temp = @head                         # => #<Node:0x007fbaeb1dcdd0 @value="Bob", @pointer=#<Node:0x007fbaeb1d7f38 @value="Jeff", @pointer=#<Node:0x007fbaeb1d63e0 @value="Ryan", @pointer=#<Node:0x007fbaeb1d45b8 @value="Adam", @pointer=nil>>>>
    counter = 1                          # => 1
    until counter == index - 1           # => true
      temp = temp.pointer
      counter += 1
    end                                  # => nil
    temp.pointer = temp.pointer.pointer  # => #<Node:0x007fbaeb1d63e0 @value="Ryan", @pointer=#<Node:0x007fbaeb1d45b8 @value="Adam", @pointer=nil>>
  end                                    # => :remove_by_index

  def remove_by_value(value)
    temp = @head
    until temp.pointer.value == value
      temp = temp.pointer
    end
    temp.pointer = temp.pointer.pointer
  end                                    # => :remove_by_value

end  # => :remove_by_value

list = LinkedList.new("Bob")  # => #<LinkedList:0x007fbaeb1dcdf8 @head=#<Node:0x007fbaeb1dcdd0 @value="Bob", @pointer=nil>>
list.append("Jeff")           # => #<Node:0x007fbaeb1d7f38 @value="Jeff", @pointer=nil>
list.append("Ryan")           # => #<Node:0x007fbaeb1d63e0 @value="Ryan", @pointer=nil>
list.append("Adam")           # => #<Node:0x007fbaeb1d45b8 @value="Adam", @pointer=nil>
list                          # => #<LinkedList:0x007fbaeb1dcdf8 @head=#<Node:0x007fbaeb1dcdd0 @value="Bob", @pointer=#<Node:0x007fbaeb1d7f38 @value="Jeff", @pointer=#<Node:0x007fbaeb1d63e0 @value="Ryan", @pointer=#<Node:0x007fbaeb1d45b8 @value="Adam", @pointer=nil>>>>>
list.remove_by_index(2)       # => #<Node:0x007fbaeb1d63e0 @value="Ryan", @pointer=#<Node:0x007fbaeb1d45b8 @value="Adam", @pointer=nil>>
list                          # => #<LinkedList:0x007fbaeb1dcdf8 @head=#<Node:0x007fbaeb1dcdd0 @value="Bob", @pointer=#<Node:0x007fbaeb1d63e0 @value="Ryan", @pointer=#<Node:0x007fbaeb1d45b8 @value="Adam", @pointer=nil>>>>
