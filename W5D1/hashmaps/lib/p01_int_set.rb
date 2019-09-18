class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise "Out of bounds" if !is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
    return false if num > @store.length || num < 0
    true
  end

  def validate!(num)

  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % 20] << num
  end

  def remove(num)
    @store[num % 20].delete_at(@store[num % 20].index(num))
   end

  def include?(num)
    @store[num % 20].each do |ele|
      return true if ele == num
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count
  attr_reader :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return nil if include?(num)
    resize! if @store.length < count + 1
    @count += 1
    # debugger
    @store[num % (@store.length)] << num

  end

  def remove(num)
    if include?(num)
      @store[num % (@store.length)].delete_at(@store[num % (@store.length)].index(num))
      @count -= 1
    end
  end

  def include?(num)
    @store[num % (@store.length)].each do |ele|
      return true if ele == num
    end
    false
  end

  # private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    return @store[num % (@store.length)]
  end

  def num_buckets
    @store.length
  end

  def resize!
    resize = Array.new(@store.length * 2) {Array.new}
    # debugger
    @store.each do |bucket|
      bucket.each do |ele|
        resize[ele % (20 * 2 ^ @count)] << ele
      end
    end
    @store = resize

  end

end

# test = ResizingIntSet.new()
# test.insert(3)
# test.insert(3)
# p test.include?(3)
# p test[3]
# p test.resize!
# p test.store.length

