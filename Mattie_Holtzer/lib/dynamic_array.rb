require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @capacity = 8
    @length = 0
    @store = []
  end

  # O(1)
  def [](index)
    raise "index out of bounds" if index>(@length-1)
    @store[index]
  end

  # O(1)
  def []=(index, value)
    @store[index] = value
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length<1
    @store.pop()
    @length-=1
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    @store.push(val)
    @length+=1
    if @length>@capacity
      @capacity*=2
    end
  end

  # O(n): has to shift over all the elements.
  def shift
    raise "index out of bounds" if @length<1
    @store.shift()
    @length-=1
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    @store.unshift(val)
    @length+=1
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!

  end
end
