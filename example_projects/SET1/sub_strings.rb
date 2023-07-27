# takes: word & dictionary of valid substrings
# returns: hash listing of substrings in hash format
# dictionary =[,] 


def substrings(word, dictionary)
    wordHash = Hash.new(0)

    for start_index in 0...word.length do
        for end_index in start_index...word.length do
            substring = word[start_index..end_index]
            if dictionary.include?(substring)
                wordHash[substring] += 1
            end
        end
    end

    return wordHash
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)