# if string letter bw a-z, find indexed value in alphabet and push into resultString
# if string letter bw A-Z, find indexed downdase value in alphabet and push into resultString
# if shiftFactor pushes value past string, use modulus (% 26), add remainder to beginning of alphabet to find new indexed value


def caesarCipher(string,shiftFactor)
    alphabet = 'abcdefghijklmnopqrstuvwxyz'
    resultString = ""

    for index in 0...string.length do

        if (string[index] >= 'a' && string[index] <= 'z') 
            # find index value
            char_index = alphabet.index(string[index])
            # find new index value
            new_index = (char_index + shiftFactor) % 26 # factors for if shiftFactor pushes index past 26
            # resulting value
            resultString += alphabet[new_index]

        elsif (string[index] >= 'A' && string[index] <= 'Z')
            char_index = alphabet.index(string[index].downcase)

            new_index = (char_index + shiftFactor) % 26

            resultString += alphabet[new_index].upcase
        else
            resultString += string[index]
        end
    end

    return resultString
end

message = "I love coding in Ruby!"
puts caesarCipher(message,1)
