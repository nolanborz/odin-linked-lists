
class LinkedList
  attr_accessor :head, :tail
  def initialize
    @head = nil
    @tail = nil
    @size = 0
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
    @size += 1
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
    @size += 1
  end

  def size
    @size
  end

  def head
    @head
  end

  def tail
    @tail
  end
  def at(index)
    return nil if index < 0
    current = @head
    index.times do
      return nil if current.nil?
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
    @size -= 1
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
  def insert_at(value, index)
    if index <= 0
      prepend_to_front(value)
    elsif index >= @size
      append_to_end(value)
    else
      new_node = Node.new(value)
      previous_node = at(index - 1)
      new_node.next_node = previous_node.next_node
      previous_node.next_node = new_node
    end
    @size += 1
  end
  def remove_at(index)
    return nil if index < 0 || index >= @size
    if index == 0
      removed_node = @head.value
      @head = @head.next_node
      @tail = nil if @head.nil?
    else
      previous_node = at(index - 1)
      removed_node = previous_node.next_node
      removed_value = removed_node.value
      previous_node.next_node = removed_node.next_node
      @tail = previous_node if index == @size - 1
    end
    @size -= 1
    removed_value
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
list.append_to_end('shien')
list.append_to_end('kizan')
list.append_to_end('kaigeki')
list.remove_at(0)

current = list.head
while current
  puts current.value
  current = current.next_node
end

puts list.to_s