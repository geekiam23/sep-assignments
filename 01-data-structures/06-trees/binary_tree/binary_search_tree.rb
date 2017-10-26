require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    # If the root rating is greater than the node rating
    if root.rating > node.rating
      # If the root to the left is nil, then assign the root to the left to the node else recall this method and replace the original root with the one on the left
      root.left.nil? ? (root.left = node) : insert(root.left, node)
    else
      # If the root to the right is nil, then assign the root to the right to the node else recall this method and replace the root that is being called with the one on the right
      root.right.nil? ? (root.right = node) : insert(root.right, node)
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    # If the root or the data is nil then return nil
    if root.nil? || data.nil?
      return nil
    else
      # If the root title equals the data then return the root info
      if root.title == data
        return root
      # If the root to the left does not equal nil then rerun the the find method and replace the original root with the one on the left.
      # Is this correct?
      elsif root.left != nil
        find(root.left, data)
      # If the root to the right does not equal nil then rerun the the find method and replace the original root with the one on the right.
      # Is this correct?
      elsif root.right != nil
        find(root.right, data)
      end
    end
  end

  def delete(root, data)
    # If the root or the data is nil then return nil
    if root.nil? || data.nil?
      return nil
    else
    # Find the root and data that you would like to delete and set it to target_node
      target_node = find(root, data)
    # If the target node is nil then return nil else assign the target node title and rating to nil
      target_node.nil? ? nil : (target_node.title = nil && target_node.rating = nil)
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    queue = [@root]
    result = []
    while queue.length > 0
      new_root = queue.shift
      if new_root.left != nil
        queue.push(new_root.left)
      end
      if new_root.right != nil
        queue.push(new_root.right)
      end
      result.push("#{new_root.title}: #{new_root.rating}")
    end
    result.each {|x| puts x}
  end
end
