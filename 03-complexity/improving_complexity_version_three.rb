def space_conscious_ruby(*arrays)
  com_array = []
  arrays.each do |arr|
    arr.each do |val|
      com_array.push(val)
    end
  end
  while com_array.length > 0
    lowVal = com_array[0]
    com_array.each do |val|
      if val < lowVal
        lowVal = val
      end
    end
    puts com_array.delete(lowVal)
  end
end