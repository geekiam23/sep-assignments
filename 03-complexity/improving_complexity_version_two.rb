def timely_ruby(*arrays)
  com_array = []
  arrays.each do |arr|
    for val in arr
      if com_array.length == 0
        com_array.push(val)
      elsif val <= com_array[0]
        com_array.insert(0, val)
      elsif val > com_array.last
        com_array.push(val)
      else
        lowVal = 0
        highVal = com_array.length - 1
        midVal = (com_array.length / 2).floor
        while lowVal != highVal
          if val == com_array[midVal]
            com_array.insert(midVal, val)
            break
          elsif val < com_array[midVal] && val > com_array[midVal - 1]
            com_array.insert(midVal, val)
            break
          elsif val > com_array[midVal] && val < com_array[midVal + 1]
            com_array.insert(midVal + 1, val)
            break
          elsif val < com_array[midVal]
            highVal = midVal
            midVal = ((highVal + lowVal) / 2).floor
          elsif val > com_array[midVal]
            lowVal = midVal
            midVal = ((highVal + lowVal) / 2).floor
          end
        end
      end
    end
  end
  com_array
end