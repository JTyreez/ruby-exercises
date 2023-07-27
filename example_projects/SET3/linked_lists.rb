# create a linked list with various methods in the linked list class

class node
    attr_accessor :value, :next_node
    def initialize(value = nil)
        @value = value
        @next_node = nil
    end
end

class linked_list
    def initialize
        @head = nil
    end

    def append(value)
        # adds new node w/ value to end of list
        new_node = Node.new(value)
        if @head.nil?
            @head = new_node
        else
            tail_node.ext_node = new_node
        end
    end

    def prened(value)
        # adds new node w/ value to start of list
        new_node = Node.new(value)
        new_node.next_node = @head
        @head = new_node
    end

    def size
        # returns total number of nodes in list
        count = 0
        current_node = @head
        while current_node
            cont += 1
            current_node = current_node.next_node
        end
        count
    end

    def head
        # returns head of list (1st node)
        @head
    end

    def tail
        # returns tail of list (last node)
        return nil if @head.nil?
    
        current_node = @head
        while current_node.next_node
            current_node = current_node.next_node
            end
            current_node
        end
    end

    def at(index)
        # returns node at given index
    return nil if @head.nil?

    current_node = @head
    i = 0
    while current_node
      return current_node if i == index
      i += 1
      current_node = current_node.next_node
    end
    nil
  end

  def pop
    # removes last element from the list
    return nil if @head.nil?

    if @head.next_node.nil?
      value = @head.value
      @head = nil
    else
      current_node = @head
      while current_node.next_node.next_node
        current_node = current_node.next_node
      end
      value = current_node.next_node.value
      current_node.next_node = nil
    end
    value
  end

  def contains?(value)
    # boolean for if a value is in list
    current_node = @head
    while current_node
      return true if current_node.value == value
      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    # returns the index for node with the value
    current_node = @head
    index = 0
    while current_node
      return index if current_node.value == value
      index += 1
      current_node = current_node.next_node
    end
    nil
  end

  def insert_at(value, index)
    # inserts new node w/ value at given index
    if index.zero?
      prepend(value)
    elsif index == size
      append(value)
    else
      prev_node = at(index - 1)
      new_node = Node.new(value)
      new_node.next_node = prev_node.next_node
      prev_node.next_node = new_node
    end
  end

  def remove_at(index)
    # removes node at given index
    if index.zero?
      @head = @head.next_node
    elsif index < size
      prev_node = at(index - 1)
      prev_node.next_node = prev_node.next_node.next_node
    else
      nil
    end
  end

  def to_s
    # represent linkedlist as strings: ( value ) --> ( value ) --> ( value ) --> nil
    current_node = @head
    str = ''
    while current_node
      str += "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    str + 'nil'
  end

  private

end