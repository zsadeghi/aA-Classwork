class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return true if include?(key.hash)
    resize! if num_buckets < count + 1
    @count += 1
    @store[key.hash % num_buckets] << key
  end

  def include?(key)
    @store[key.hash % num_buckets].each do |ele|
      return true if ele == key
    end
    false
  end

  def remove(key)
    if include?(key)
      @store[key.hash % num_buckets].delete_at(@store[key.hash % num_buckets].index(key))
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    return @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    resize = Array.new(num_buckets * 2) {Array.new}
    
    @store.each do |bucket|
      bucket.each do |ele|
        resize[ele % (20 * 2 ^ @count)] << ele
      end
    end
    @store = resize

  end
end
