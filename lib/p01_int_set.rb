class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(@max, false)
  end

  def insert(num)
    raise 'Out of bounds' if num > @max || num < 0
    @store.push[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)

  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % num_buckets] << num unless include?(num)
  end

  def remove(num)
    @store[num % num_buckets].delete(num)
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
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
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if count == num_buckets
    @store[num % num_buckets] << num unless include?(num)
    @count += 1
  end

  def remove(num)
    @store[num % num_buckets].delete(num)
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_num_buckets = 2 * num_buckets
    new_store = Array.new(new_num_buckets) { Array.new }
    @store.each do |bucket|
      bucket.each do |num|
        new_store[num % new_num_buckets] << num
      end
    end

    @store = new_store
  end
end
