def better_written_ruby(*arrays)
  com_array = []
  arrays.each do |arr|
    for val in arr
      i = 0
      if com_array.length == 0
        com_array.push(val)
      else
        while i < com_array.length
          if val <= com_array[i]
            com_array.insert(i, val)
            break
          elsif i == com_array.length - 1
            com_array << val
            break
          end
          i+= 1
        end
      end
    end
  end
  com_array
end