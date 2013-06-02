require 'thread'

class MinHeap
  def initialize
    @elems = []
    @mutex = Mutex.new
  end

  def size
    @mutex.synchronize do
      @elems.size
    end
  end

  alias_method :length, :size
  alias_method :count, :size

  def empty?
    size == 0
  end

  def parent_of_index(index)
    (index - 1)/2
  end

  def push(elem)
    @mutex.synchronize do
      @elems.push elem
      index = size - 1
      parent = parent_of_index index
      while parent >= 0 and @elems[parent] > @elems[index]
        tmp = @elems[parent]
        @elems[parent] = @elems[index]
        @elems[index] = tmp

        index = parent
        parent = parent_of_index index
      end
    end
  end

  alias_method :<<, :push

  def pop
    @mutex.synchronize do
      return nil if empty?
      return @elems.pop if @elems.size == 1

      min = @elems.first
      @elems[0] = @elems.pop

      index = 0
      leftchild = 1

      while leftchild < size
        smallerchild = (leftchild + 1 < size and @elems[leftchild] > @elems[leftchild+1]) ? leftchild+1 : leftchild
        break if @elems[smallerchild] > @elems[index]

        tmp = @elems[smallerchild]
        @elems[smallerchild] = @elems[index]
        @elems[index] = tmp

        index = smallerchild
        leftchild = 2 * index + 1
      end

      min
    end
  end

  def peek
    @mutex.synchronize do
      return @elems.first
    end
  end
end
