require_relative 'linked_list'
require_relative 'node'

class SeparateChaining
  attr_reader :max_load_factor
  attr_accessor :entries

  def initialize(size)
    @max_load_factor = 0.7
    @entries = 0
    @hash = Array.new(size)
  end

  def []=(key, value)
    # Look up this?? How does this work?? Have to understand hash.sum % size
    i = index(key, size())
    # If statement asking if the hash at this index is nil
    if @hash[i] == nil
      # Create a nre linked list at this index
      @hash[i] = LinkedList.new
      # Brings in the method of add to front from the linked list class and adds this specfic node to the the front.
      # Why add this to the front of the node and not at the end??
      # We could have added it to the end
      @hash[i].add_to_front(Node.new(key, value))
      # Increase the amount of entries for the load factor method
      @entries += 1
    # If the hash at this index is not nil then it must have some nodes already in the hash
    else
      # Assign the index's head to variable "currNode"
      # Where does .head come from?
      # This is a built-in Ruby method
      currNode = @hash[i].head
      # Created a loop to cycle through the current node. If it finds one that is equal to nil or the same key, take currNode and assign next in line
      until currNode == nil || currNode.key == key
        currNode = currNode.next
      end
      # If the node was nil, add a new node to the front of the hash.
      # Again, Why do we put it at the front of the hash
      if currNode == nil
        @hash[i].add_to_front(Node.new(key, value))
        # Increase the number of entries so we can Calculate load factor
        @entries += 1
      # If the currNode key is the same as the key and the value is not the same then assign the value within this key
      elsif currNode.key == key && currNode.value != value
        currNode.value = value
      # Else it is a duplicate
      else
        return "duplicate"
      end
    end
    # If the load factor is greater than the assigned max_load_factor, call the resize method
    if load_factor() > @max_load_factor
      resize()
    end
  end

  def [](key)
    # Look up this?? How does this work?? Have to understand hash.sum % size
    i = index(key, size())
    # If the index is not nil, assign the head of this index ro currNode
    if @hash[i] != nil
      currNode = @hash[i].head
      # Until the currNode equals nil or the same key, assign the currNode to the next spot.
      until currNode == nil || currNode.key == key
        currNode = currNode.next
      end
      # If the currNode is equal to nil return the hash pair is not found
      if currNode == nil
        return "hash pair not found"
      # If thats not the case then return the value of the currNode
      else
        return currNode.value
      end
    # If the index is equal to nil then return no match
    else
      return "no match"
    end
  end

  def print_hash
    #  Creates an array that starts with 0 and ends with the lenght of the hash.
    (0...size()).each do |i|
      # If the index at this specfic place does not equal nil, then display the index, the key, and the value.
      if @hash[i] != nil
        puts "index: #{i}"
        @hash[i].print
      end
    end
    # Displays the load factor.
    puts "load factor: #{load_factor()}"
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    # Look into this. Same as previous ???
    # Review the base of tens to get a better understanding.
    return key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    # This calculates the load factor of the hash.
    # We take the size then add a decimal behind the last number.
    size = size() + 0.0
    # We divide entries by size
    lf = @entries / size
    # Return load factor
    return lf
  end

  # Simple method to return the number of buckets in the hash
  def size
    return @hash.length
  end

  # Resize the hash
  def resize
    # Create a new array that we double in size.
    arrXfer = Array.new(@hash.length * 2)
    # We create an array that starts with 0 and ends with the length of the original hash
    p @hash
    p arrXfer
    (0...@hash.length).each do |i|
      # If the index of this hash does not equal nil, assign the head of this index to currNode
      if @hash[i] != nil
        currNode = @hash[i].head
        # Until the currNode equals nil
        until currNode == nil
          # Do not understand this part!!!
          newIndex = currNode.key.sum % arrXfer.length
          # Assign a new linked list to the index of the new array
          arrXfer[newIndex] = LinkedList.new
          # Add the currNode to the front of the index or buckets
          # Why the front of the bucket?
          arrXfer[newIndex].add_to_front(currNode)
          # Assign the currNode to the next node in linked
          # Why assign it to the next place
          # This sets currNode to the next node so that it can run in the until loop.
          currNode = currNode.next
        end
        # Assigns the index to nil so that there is not a problem for the next item in the loop
        @hash[i] = nil
      end
    end
    # assign the transfer array to our hash array
    @hash = arrXfer
  end
end
