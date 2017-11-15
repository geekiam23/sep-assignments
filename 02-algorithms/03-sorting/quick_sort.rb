def quick_sort(collection)
  # if the collection has only one item, return item
  return collection if collection.length <= 1

  # pick a random number from from index 0 to the last number and remove it from the collection and assign it to the variable pivot
  pivot = collection.delete_at(rand(0..collection.length - 1))
  # create an empty array for lower collection
  lower = []
  # create an empty array for higher collection
  higher = []
  # create an empty array for sorted collection
  sorted_arr = []

  # for every number between 0 and the last number do the following
  (0..collection.length - 1).each do |i|
    # if item at this index in the collection is less than the pivot
    if collection[i] < pivot
      # push the item to the lower collection
      lower << collection[i]
    else
      # else (if the item is greater than the pivot) push the item into the higher collection
      higher << collection[i]
    end
  end
  # Call a recursive method on quick sort for the lower collection and push it into the sorted collection
  sorted_arr << quick_sort(lower)
  # push the pivot point to the sorted array
  sorted_arr << pivot
  # Call a recursive method on quick sort for the higher collection and push it into the sorted collection
  sorted_arr << quick_sort(higher)
  # flatten removes the inner arrays and make only one array that is sorted.
  sorted_arr.flatten
end

#
# array = [3, 6, 1, 2, 8, 4, 9, 7, 5]
# puts "#{quick_sort(array)}"
