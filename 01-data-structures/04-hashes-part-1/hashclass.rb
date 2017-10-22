class HashClass
  def initialize(size)
    @items = Array.new(size)
  end
  def []=(key, value) #The Custom Define Operator
    hash_item = HashItem.new(key, value) #Create a new Item to attach to the Hash
    hash_index = index(key, size) #Create the index for our new item

    if @items[hash_index] == nil
      # If the value at hash index is nil (or empty)
      # Assign the item to the index
      @items[hash_index] = hash_item
    elsif @items[hash_index].key != key
      # Else if the key of index does not equal key of the new item
      # The Hash needs to be resized
      # So we resize it and then pair the key and value
      self.resize
      self.[]=(key, value)
    elsif @items[hash_index].key == key && @items[hash_index].value != value
      # Else if there is a collision and the values are different
      # Just Resize the class Array
      self.resize
    end
  end

  def [](key)
    # Get the hashed index of the key requested
    # return the value that lived there
    hash_index = index(key, size)
    @items[hash_index].value
  end

  def resize
    # Resize the array when requested (Double it)
    old_items_array = @items
    @items = Array.new(old_items_array.length * 2)

    old_items_array.each do |item|
      if item != nil
        self[item.key] = item.value #assign value to key
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, uses the ascii value of each string
  def index(key, size)
    key.sum(64) % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
