# The code will build a binary search tree from an array of random numbers, 
# confirm if the tree is balanced, print all elements in various orders, 
# add some numbers greater than 100 to unbalance the tree, 
# confirm if the tree is unbalanced, and then rebalance the tree using the rebalance method. 

class Node
    include Comparable
    attr_accessor :data, :left, :right
  
    # initialize a new Node with the given data
    def initialize(data)
      @data = data
      @left = nil
      @right = nil
    end
  
    # Compare nodes based on data
    def <=>(other)
      @data <=> other.data
    end
  end
  
  class Tree
    attr_accessor :root
  
    # initialize a new Tree with the given array of numbers
    def initialize(arr)
      arr = arr.uniq.sort
      @root = build_tree(arr)
    end
  
    # build balanced bst
    def build_tree(arr)
      return nil if arr.empty?
  
      mid = arr.length / 2
      root = Node.new(arr[mid])
      root.left = build_tree(arr[0...mid])
      root.right = build_tree(arr[mid + 1..-1])
      root
    end
  
    # insert value into bst
    def insert(value, node = @root)
      return Node.new(value) if node.nil?
  
      if value < node.data
        node.left = insert(value, node.left)
      elsif value > node.data
        node.right = insert(value, node.right)
      end
      node
    end
  
    # delete value from bst
    def delete(value, node = @root)
      return node if node.nil?
  
      if value < node.data
        node.left = delete(value, node.left)
      elsif value > node.data
        node.right = delete(value, node.right)
      else
        return node.left if node.right.nil?
        return node.right if node.left.nil?
  
        temp = find_min(node.right)
        node.data = temp.data
        node.right = delete(temp.data, node.right)
      end
      node
    end
  
    # find node w/ given value in bst
    def find(value, node = @root)
      return nil if node.nil?
  
      if value < node.data
        find(value, node.left)
      elsif value > node.data
        find(value, node.right)
      else
        node
      end
    end
  
    # breadth-first level order
    def level_order
        return [] if @root.nil?
      
        queue = [@root]
        result = []
        while queue.any?
          current_node = queue.shift
          block_given? ? yield(current_node) : result << current_node
          queue << current_node.left if current_node.left
          queue << current_node.right if current_node.right
        end
        block_given? ? nil : result
    end
  
    # inorder traversal
    def inorder(node = @root, &block)
      return if node.nil?
  
      inorder(node.left, &block)
      block_given? ? yield(node) : puts(node.data)
      inorder(node.right, &block)
    end
  
    # preorder traversal
    def preorder(node = @root, &block)
      return if node.nil?
  
      block_given? ? yield(node) : puts(node.data)
      preorder(node.left, &block)
      preorder(node.right, &block)
    end
  
    # postorder traversal
    def postorder(node = @root, &block)
      return if node.nil?
  
      postorder(node.left, &block)
      postorder(node.right, &block)
      block_given? ? yield(node) : puts(node.data)
    end
  
    # height of node in bst
    def height(node = @root)
      return -1 if node.nil?
  
      left_height = height(node.left)
      right_height = height(node.right)
      [left_height, right_height].max + 1
    end
  
    # depth of node in bst
    def depth(node)
      return -1 if node.nil?
  
      current_node = @root
      depth = 0
      until current_node.nil?
        return depth if current_node == node
  
        if node < current_node
          current_node = current_node.left
        else
          current_node = current_node.right
        end
        depth += 1
      end
      nil
    end
  
    # check if tree is balanced
    def balanced?(node = @root)
      return true if node.nil?
  
      left_height = height(node.left)
      right_height = height(node.right)
  
      balanced = (left_height - right_height).abs <= 1
      balanced && balanced?(node.left) && balanced?(node.right)
    end
  
    # rebalance tree
    def rebalance
      arr = level_order.map(&:data)
      @root = build_tree(arr)
    end
  
    private
  
    # find min node
    def find_min(node)
      current_node = node
      current_node = current_node.left while current_node.left
      current_node
    end
  end
  
  # Test the Tree class with a simple driver script
  random_numbers = Array.new(15) { rand(1..100) }
  tree = Tree.new(random_numbers)
  
  puts "Balanced? #{tree.balanced?}"
  puts "Level order:"
  tree.level_order { |node| print "#{node.data} " }
  puts "\nInorder:"
  tree.inorder { |node| print "#{node.data} " }
  puts "\nPreorder:"
  tree.preorder { |node| print "#{node.data} " }
  puts "\nPostorder:"
  tree.postorder { |node| print "#{node.data} " }
  
  puts "\nInserting 101, 102, 103..."
  tree.insert(101)
  tree.insert(102)
  tree.insert(103)
  
  puts "Balanced? #{tree.balanced?}"

puts "\nRebalancing the tree..."
tree.rebalance

puts "Balanced? #{tree.balanced?}"

puts "\nLevel order (after rebalancing):"
tree.level_order { |node| print "#{node.data} " }

puts "\nInorder (after rebalancing):"
tree.inorder { |node| print "#{node.data} " }

puts "\nPreorder (after rebalancing):"
tree.preorder { |node| print "#{node.data} " }

puts "\nPostorder (after rebalancing):"
tree.postorder { |node| print "#{node.data} " }