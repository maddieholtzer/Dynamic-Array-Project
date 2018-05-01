require_relative "static_array"

class RingBuffer
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
  def []=(index, val)
    @store[index] = val
  end

  # O(1)
  def pop
    raise "index out of bounds" if @length<1
    @length-=1
    @store.pop()
  end

  # O(1) ammortized
  def push(val)
    @store.push(val)
    @length+=1
    if @length>@capacity
      @capacity*=2
    end
  end

  # O(1)
  def shift
    raise "index out of bounds" if @length<1
    @length-=1
    @store.shift()
  end

  # O(1) ammortized
  def unshift(val)
    @store.unshift(val)
    @store[0] = @store[0]
    @length+=1
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
  end

  def resize!
  end
end
