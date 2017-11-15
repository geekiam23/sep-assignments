def bucket_sort(arr)
  # if array is empty or have one item return array
  if arr.empty? || arr.length == 1
    return arr
  end

  # determine minimum and maximum values
  min = arr.min
  max = arr.max

  # calculate the amount of buckets that we will need by taking the difference of max and min and dividing it by the array length and round down then add one to it
  bucket_count = ((max - min) / arr.length).ceil + 1
  # we create a new array with the number of buckets that we need
  buckets = Array.new(bucket_count)
  # we create a new array(bucket) at each index
  (0..buckets.length - 1).each do |i|
    buckets[i] = []
  end

  # put array values into buckets
  (0..arr.length - 1).each do |i|
    # we take the difference of the item and minimum and divide it by the arr length and take that number and round up. We take that number and that is the index where we will push this item
    buckets[((arr[i] - min) / arr.length).floor].push(arr[i])
  end

  # Sort buckets and place back into input array
  arr = []
  # we use insertion sort to sort the buckets.
  (0..buckets.length - 1).each do |i|
    buckets[i] = insertion_sort(buckets[i])
    buckets[i].each do |value|
      arr.push(value)
    end
  end

  arr
end

def insertion_sort(collection)
  sorted_array = [collection.delete_at(0)]

  until collection.length == 0
    insert_value = collection.shift
    i = 0
    until i == sorted_array.length || insert_value < sorted_array[i]
      i += 1
    end
    sorted_array.insert(i, insert_value)
  end

  sorted_array
end
#
#
# array = [3, 6, 1, 2, 8, 4, 9, 7, 5]
# puts "#{bucket_sort(array)}"
