require_relative './node'  # => true
require 'pry'              # => true
class LinkedList

  attr_accessor :head, :index  # => nil
  def initialize(value = nil)
    @head = Node.new(value)    # => #<Node:0x007fd152876fb0 @value="Jeff", @pointer=nil>
    @index = 1                 # => 1
  end                          # => :initialize

  def tail
    temp = @head               # => #<Node:0x007fd152876fb0 @value="Jeff", @pointer=nil>, #<Node:0x007fd152876fb0 @value="Jeff", @pointer=#<Node:0x007fd152874fd0 @value="Ryan", @pointer=nil>>, #<Node:0x007fd152876fb0 @value="Jeff", @pointer=#<Node:0x007fd152874fd0 @value="Ryan", @pointer=#<Node:0x007fd15286f6e8 @value="Bob", @pointer=nil>>>, #<Node:0x007fd152876fb0 @value="Jeff", @pointer=#<Node:0x007fd152874fd0 @value="Ryan", @pointer=#<Node:0x007fd15286f6e8 @value="Bob", @pointer=#<Node:0x007fd15286d9d8 @value="Kate", @pointer=nil>>>>
    until temp.pointer == nil  # => true, false, true, false, false, true, false, false, false, true
      temp = temp.pointer      # => #<Node:0x007fd152874fd0 @value="Ryan", @pointer=nil>, #<Node:0x007fd152874fd0 @value="Ryan", @pointer=#<Node:0x007fd15286f6e8 @value="Bob", @pointer=nil>>, #<Node:0x007fd15286f6e8 @value="Bob", @pointer=nil>, #<Node:0x007fd152874fd0 @value="Ryan", @pointer=#<Node:0x007fd15286f6e8 @value="Bob", @pointer=#<Node:0x007fd15286d9d8 @value="Kate", @pointer=nil>>>, #<Node:0x007fd15286f6e8 @value="Bob", @pointer=#<Node:0x007fd15286d9d8 @value="Kate", @pointer=nil>>, #<Node:0x007fd15286d9d8 @value="Kate", @pointer=nil>
    end                        # => nil, nil, nil, nil
    temp                       # => #<Node:0x007fd152876fb0 @value="Jeff", @pointer=nil>, #<Node:0x007fd152874fd0 @value="Ryan", @pointer=nil>, #<Node:0x007fd15286f6e8 @value="Bob", @pointer=nil>, #<Node:0x007fd15286d9d8 @value="Kate", @pointer=nil>
  end                          # => :tail

  def append(value)
    tail.pointer = Node.new(value)  # => #<Node:0x007fd152874fd0 @value="Ryan", @pointer=nil>, #<Node:0x007fd15286f6e8 @value="Bob", @pointer=nil>, #<Node:0x007fd15286d9d8 @value="Kate", @pointer=nil>, #<Node:0x007fd152867a10 @value="Sally", @pointer=nil>
  end                               # => :append

  def prepend(value)
    @head = Node.new(value, @head)
  end                               # => :prepend

  def insert(position, value)
    if position > count + 1
      puts "something"
      return
    end
    temp = @head                                    # => #<Node:0x007fd152876fb0 @value="Jeff", @pointer=#<Node:0x007fd152874fd0 @value="Ryan", @pointer=#<Node:0x007fd15286f6e8 @value="Bob", @pointer=#<Node:0x007fd15286d9d8 @value="Kate", @pointer=#<Node:0x007fd152867a10 @value="Sally", @pointer=nil>>>>>
    index = 1                                       # => 1
    if position == 1                                # => false
      prepend(value)
      return
    end
    until index == position - 1
      index += 1                                    # => 2, 3, 4, 5, 6, 7
      temp = temp.pointer                           # ~> NoMethodError: undefined method `pointer' for nil:NilClass
    end
    change_pointer_value
      # temp_pointer = temp.pointer
      # temp.pointer = Node.new(value, temp_pointer)
  end                                               # => :insert

  def insert_at_index(index, value)
    temp = @head
    counter = 1
    until counter == index
      temp = temp.pointer
      counter += 1
    end
      temp_pointer = temp.pointer
      temp.pointer = Node.new(value, temp_pointer)
  end                                               # => :insert_at_index

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
    temp = @head
    counter = 0
    until counter == index
      counter += 1
      temp = temp.pointer
    end
    temp_pointer = temp.pointer
    temp.pointer = Node.new(value, temp_pointer)
  end                                             # => :remove_by_index

  def change_pointer_value
    temp_pointer = temp.pointer
    temp.pointer = Node.new(value, temp_pointer)
  end

end  # => :remove_by_index

list = LinkedList.new("Jeff")  # => #<LinkedList:0x007fd152877028 @head=#<Node:0x007fd152876fb0 @value="Jeff", @pointer=nil>, @index=1>
list.append("Ryan")            # => #<Node:0x007fd152874fd0 @value="Ryan", @pointer=nil>
list.append("Bob")             # => #<Node:0x007fd15286f6e8 @value="Bob", @pointer=nil>
list.append("Kate")            # => #<Node:0x007fd15286d9d8 @value="Kate", @pointer=nil>
list.append("Sally")           # => #<Node:0x007fd152867a10 @value="Sally", @pointer=nil>
list                           # => #<LinkedList:0x007fd152877028 @head=#<Node:0x007fd152876fb0 @value="Jeff", @pointer=#<Node:0x007fd152874fd0 @value="Ryan", @pointer=#<Node:0x007fd15286f6e8 @value="Bob", @pointer=#<Node:0x007fd15286d9d8 @value="Kate", @pointer=#<Node:0x007fd152867a10 @value="Sally", @pointer=nil>>>>>, @index=1>
list.insert(9, "Alex")
list

# ~> NoMethodError
# ~> undefined method `pointer' for nil:NilClass
# ~>
# ~> /Users/justinpease/Turing_All/Module_1.2/Projects/Linkedlist/lib/linkedlist.rb:36:in `insert'
# ~> /Users/justinpease/Turing_All/Module_1.2/Projects/Linkedlist/lib/linkedlist.rb:123:in `<main>'
