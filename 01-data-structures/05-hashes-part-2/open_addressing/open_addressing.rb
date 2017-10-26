require_relative 'node'

class OpenAddressing
  def initialize(size)
    @hash = Array.new(size)
    @entries = 0
  end

  # Dont understand the failing test.

  def []=(key, value)
    # Understand - Create the index for our new item
    hash_index = index(key, size())

    if @hash[hash_index] == nil
      # Understand - If the value at hash index is nil (or empty)
      # Understand - Create a new node at the hash's index
      @hash[hash_index] = Node.new(key, value)
      # This calculates the number of entries so that the load factor method can use it.
      @entries += 1
    elsif @hash[hash_index].key == key && @hash[hash_index].value == value
      # Understand - Else if the key of index does equal key and value
      # Understand - Return that this is a duplicate
      return "duplicate"
    elsif @hash[hash_index].key == key && @hash[hash_index].value != value
      # Understand - Else if the hash's key is the same but the value is different. Add value to this key (chain)
      @hash[hash_index].value = value
    else
      # Understand - If nothing matches the criteria. Run the method next_open_index to find the next open block or index
      # Understand - Assign the next open index or block to next_opening
      next_opening = next_open_index(hash_index)
      p next_opening
        # If next_opening's index is the last in the array/hash. Why does it matter if its the last in the next before resizing? Is that what the -1 means?
      if next_opening == -1
        # Understand - Call the method resize
        resize()
        # Understand - The object self assign its key and value
        self[key] = value
      # Understand - Else Add a new node at the next_opening index or block
      else
        @hash[next_opening] = Node.new(key, value)
        # This calculates the number of entries so that the load factor method can use it.
        @entries += 1
      end
    end
  end

  def [](key)
    # Understand - Creates an array that starts at 0 and ends with whatever the length of the instance of hash is
    (0...size()).each do |i|
      # If it gets to an index and it is not empty and the key equals the same key, then return the value. Why return the value and not assign it?
      if @hash[i] != nil
        if @hash[i].key == key
          return @hash[i].value
        end
      end
    end
    return "pair not found"
  end

  def print_hash
    #  Creates an array that starts with 0 and ends with the length of the hash.
    (0...size()).each do |i|
      # If the index at this specfic place does not equal nil, then display the index, the key, and the value.
      if @hash[i] != nil
        puts "index: #{i}, #{@hash[i].key}: #{@hash[i].value}"
      end
    end
    # Displays the load factor.
    puts "load factor: #{load_factor()}"
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    # Review the base of tens to get a better understanding.
    # We can use ascii value to determine every key on the keyboard.
    # Turn letters and symbols into numbers.
    key.sum % size
  end

  # Given an index, find the next open index in @hash
  def next_open_index(index)
    # This creates an array that starts with the index method (which passes in the hash's index) and ends with the size method.
    (index...size()).each do |i|
      # If this index is nil, return the number that we are on in the .each loop.
      if @hash[i] == nil
        return i
      end
    end
    # Why return -1?
    return -1
  end

  # Simple method to return the number of hash in the hash
  def size
    @hash.length
  end

  def load_factor
    # This calculates the load factor of the hash.
    # We take the size then add a decimal behind the last number.
    size = size() + 0.0
    # We divide entries by size
    lf = @entries / size
    # Return load factor
    lf
  end

  # Resize the hash
  def resize
    # Create a new array that we double in size.
    arrXfer = Array.new(@hash.length * 2)
    # We create an array that starts with 0 and ends with the length of the original hash
    p @hash
    p arrXfer
    (0...@hash.length).each do |el|
      # Look this up?? Why is there not a comparison like @hash[el].key != key?
      # This is to protect our code if anything goes wrong.
      # Will return as true
      if @hash[el]
        # Look this up?? Same as finding the index in the above function.
        newIndex = @hash[el].key.sum % arrXfer.length
        # Assigns the old index to the new array
        arrXfer[newIndex] = @hash[el]
        # Assigns the index to nil so that there is not a problem for the next index
        @hash[el] = nil
      end
    end
    # assign the transfer array to our hash array
    @hash = arrXfer
    p @hash
  end
end
