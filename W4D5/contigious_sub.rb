
def largest_contiguous_subsum(list)

    sum = 0 #5,8,1
    curr_sum = 0 #5,8

    list.each do |num|
        sum += num
        if sum < 0 
            sum = 0
        end
        if curr_sum < sum 
            curr_sum = sum
        end
    end
    curr_sum
end

list = [5, 3, -7] 
# [15,-7,3,-8,20]
p largest_contiguous_subsum(list) # => 8

#     # possible sub-sums
#     [5]           # => 5
#     [5, 3]        # => 8 --> we want this one
#     [5, 3, -7]    # => 1
#     [3]           # => 3
#     [3, -7]       # => -4
#     [-7]          # => -7

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])