# like permutations fml

def first_anagram?(str)
    return [str] if str.length <= 1
    possible_anagrams = []
    i = 0
    while i < str.length
        moized = first_anagram?(str[0...i] + str[i+1..-1])
        possible_anagrams.concat(moized.map {|sub_str| str[i] + sub_str})
        i += 1
    end
    possible_anagrams
end

# Write a method #second_anagram? that iterates over the first string. 
# For each letter in the first string, find the index of that letter 
# in the second string (hint: use Array#find_index) and delete at that 
# index. The two strings are anagrams if an index is found for every 
# letter and the second string is empty at the end of the iteration.

def second_anagram?(str1, str2)
    test = str2.dup
    str1.each_char do |char|
        cut = test.index(char) 
        if cut 
            test.slice!(test.index(char))
        end
    end
    test
end

if $PROGRAM_NAME == __FILE__
    p first_anagram?("mic")
    p second_anagram?("mic", "iam")
end