
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

current = list.head
while current
  puts current.value
  current = current.next_node
end