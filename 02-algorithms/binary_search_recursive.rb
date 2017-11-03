Class BinarySearch
  def RecursiveBinarySearch(collection, low, high, value)
    if (low > high) 
      return -1
    end
    mid = low + (high - low) / 2

    if value == collection[mid]
      return mid
    elsif value < collection[mid]
      return RecursiveBinarySearch(collection, low, mid - 1, value)
    else
      return RecursiveBinarySearch(collection, mid + 1, high, value)
    end
  end
end
