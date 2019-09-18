class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    str = ""
    self.each do |ele|
      str += ele.to_s(2)
    end
    str.to_i
  end
end

class String
  def hash
    str = []
    self.each_char do |char|
      str += char.unpack("B*")
    end
    str.join.to_i
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    keys = self.keys.sort.join.unpack("B*").join.to_i
    values = self.values.sort.join.unpack("B*").join.to_i

    keys + values
  end
end
