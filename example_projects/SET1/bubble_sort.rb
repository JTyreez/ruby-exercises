#takes: array
#returns: sorted array using bubble method

def bubble_sort (list)
    for i in 0...list.length do 
        sorted = true

        for j in 0...(list.length - i - 1)
            if list[j] > list[j+1]
                list[j], list[j+1] = list[j+1], list[j]
                sorted = false
            end
        end

    break if sorted

    end

    return list
end

bubble_sort([4,3,78,2,0,2])

            