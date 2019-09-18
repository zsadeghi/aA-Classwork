# def two_sum(array, target)
#     hash = Hash.new { |k, v| hash[k] = v}
#     array.each_with_index do |ele, i|
#         hash[ele] = i
#     end
#     array.each_with_index do |ele, i|
#          other = target - ele
#          return [i, hash[other]] if hash.key?(other) && hash[other] != i   
#     end
#     return nil
# end

def two_sum(array, target)
    hash = Hash.new
    array.each_with_index do |ele, i|
        hash[ele] = i
        other = target - ele
        return [i, hash[other]] if hash.key?(other) && hash[other] != i
    end
    return nil
end



p two_sum([1,4,5,3,0,-1],4) # [0,3],[1,4],[2,5]
p two_sum([1,2,3], 5) # [1,2]
p two_sum([1,4,3], 2) # nil




