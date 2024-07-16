
class LinkedList
  attr_accessor :head, :tail
  def initialize
    @head = nil
    @tail = nil
  end

  def append_to_end(value)
    new_node = Node.new(value)
      
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next_node = new_node
      @tail = new_node
    end
  end

  def prepend_to_front(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
  end
  def size
    return 0 if @head.nil?
    count = 0
    current = @head
    while current
      count += 1
      current = current.next_node
    end
    count
  end
  def head
    @head
  end
  def tail
    @tail
  end
  def at(index)
    count = 0
    current = @head
    until count >= index
      count +=1
      current = current.next_node
    end
    current
  end
  def pop
    return nil if @head.nil?

    if @head == @tail
      value = @head.value
      @head = @tail = nil
      return value
    end
    current = @head
    while current.next_node!= @tail
      current = current.next_node
    end
    value = @tail.value
    @tail = current
    @tail.next_node = nil

    value
  end
  def contains?(value)
    current = @head
    while current
      return true if current.value == value
      current = current.next_node
    end
    false
  end
  def find(value)
    current = @head
    count = 0
    while current
      return count if current.value == value
      current = current.next_node
      count += 1
    end
    nil
  end
  #You can use string interpolation for some minor optimizations.
  #def to_s
  #  elements = []
  #  current = @head
  #  while current
  #    elements << "( #{current.value} )"
  #    current = current.next_node
  #  end
  #  elements.join(' -> ') + ' -> nil'
  #end
  def to_s
    current = @head
    str = ""
    while current
      str += "( #{current.value} ) -> "
      current = current.next_node
    end
    str += "nil"
    str
  end

  
  class Node
    attr_accessor :value, :next_node
    def initialize(value)
      @value = value
      @next_node = nil
    end
  end
end
list = LinkedList.new
list.append_to_end(1)
list.append_to_end(2)
list.append_to_end(3)
list.prepend_to_front(10)
list.prepend_to_front(24)

current = list.head
while current
  puts current.value
  current = current.next_node
end
puts list.pop()
current = list.head
while current
  puts current.value
  current = current.next_node
end
puts list.to_s