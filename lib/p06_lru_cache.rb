require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map[key]
      update_node!(@map[key])
    else
      calc!(key)
      eject! if count > @max
    end
    @map[key].val
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
    @store.append(key, @prc.call(key))
    @map[key] = @store.last
  end

  def update_node!(node)
    # suggested helper method; move a node to the end of the list    link.prev.next = link.next
    node.prev.next = node.next
    node.next.prev = node.prev

    node.prev = @store.tail.prev
    node.next = @store.tail
    @store.tail.prev.next = node
    @store.tail.prev = node
  end

  def eject!
    key = @store.first.key
    @store.remove(key)
    @map.delete(key)
  end
end
