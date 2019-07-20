# Given a list of integers find the smallest number in the list.

# Example:

#     list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
#     my_min(list)  # =>  -5

# def my_min_slow(list)
#     i = 0
#     sorted = true
#     while sorted
#         false

# end

def my_min(list)
    list.reduce { |min, el| min > el ? el : min}
end

list = [5, 3, -7]
def largest_contiguous_subsum(list)
    sums = []
    (0...list.length).each do |start|
        (start...list.length).each do |rear|
            sums << list[start..rear]
        end
    end
    sums.map { |sub_array| sub_array.sum }.max
end

# def small_big_o_lcs(list)
#     return list if list.length <= 1
#     max = list[0]
#     sub_array = []
#     i = 1
#     while i < list.length
#         if list[i] < 0
#             if sub_array.sum + list[i] < 0
#                 sub_array = []
#             else
#                 sub_array << list[i]
#             end
#         else
#             sub_array << list[i]
#         end
        
#         if sub_array.sum > max
#             max = sub_array.sum
#         end
#         i += 1
#     end
#     max
# end

def small_big_o_lcs(list)
    return list if list.length <= 1
    max = list[0]
    sub_sum = list[0]
    i = 1
    while i < list.length
        if list[i] < 0
            if sub_sum + list[i] < 0
                sub_sum = 0
            else
                sub_sum += list[i]
            end
        else
            sub_sum += list[i]
        end
        
        if sub_sum > max
            max = sub_sum
        end
        i += 1
    end
    max
end

if $PROGRAM_NAME == __FILE__
    list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
    p my_min(list)  # =>  -5
    #p my_min_slow(list)
    p largest_contiguous_subsum(list)
    p largest_contiguous_subsum([1,-7,8])
    p small_big_o_lcs([3,-7,2,-1,4,-2,6])
end