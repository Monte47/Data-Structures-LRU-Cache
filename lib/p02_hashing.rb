class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    sum = 0
    flatten.each_with_index do |el, i|
      sum += (el * i)
    end
    sum.hash
  end
end

class String
  def hash
    chars.map { |char| char.ord.hash }.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    sum = 0
    each do |k, v|
      sum += (k.to_s + v.to_s).hash
    end
    sum.hash
  end
end
