require 'test_helper'
require 'minheap'

class MinHeapTest < ActiveSupport::TestCase
  def setup
    @heap = MinHeap.new
  end

  def test_contains_elem
    assert_nil @heap.pop
    assert_equal 0, @heap.size
    @heap.push 1
    assert_equal 1, @heap.peek
    assert_equal 1, @heap.pop
    assert_nil @heap.pop
  end

  def test_multiple_elems_in_order
    @heap.push 2
    @heap.push 1
    assert_equal 1, @heap.pop
    assert_equal 2, @heap.peek
    assert_equal 2, @heap.pop
    assert_nil @heap.pop
  end

  def test_multiple_elems_out_of_order
    @heap.push 1
    assert_equal 1, @heap.peek
    @heap.push 2
    assert_equal 1, @heap.peek
    assert_equal 1, @heap.pop
    assert_equal 2, @heap.pop
    assert_nil @heap.pop
  end

  def test_multiple_identical_elems
    @heap.push 1
    @heap.push 1
    assert_equal 1, @heap.pop
    assert_equal 1, @heap.pop
    assert_nil @heap.pop
  end

  def test_random_in_order
    elems = [5, 2, 4, 3, 1, 7, 6, 0, 3, 2, 5]
    elems.each do |a|
      @heap << a
    end

    result = []
    until @heap.empty?
      result << @heap.pop
    end

    assert_equal elems.sort, result
  end
end
