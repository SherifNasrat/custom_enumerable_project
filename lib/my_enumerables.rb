module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    my_each do |elem|
      yield(elem, index)
      index += 1
    end
  end

  def my_all?
    my_each do |elem|
      return false unless yield(elem)
    end
    true
  end

  def my_any?
    my_each do |elem|
      return true if yield(elem)
    end
    false
  end

  def my_count
    if block_given?
      count = 0
      my_each do |elem|
        count += 1 if yield(elem)
      end
      count
    else
      length
    end
  end

  def my_none?
    my_each do |elem|
      return false if yield(elem)
    end
    true
  end

  def my_select
    elems = []
    my_each do |elem|
      elems << elem if yield(elem)
    end
    elems
  end

  def my_map
    elems = []
    my_each do |elem|
      elems << yield(elem)
    end
    elems
  end

  def my_inject(initial_value = 0)
    my_each do |elem|
      initial_value = yield(elem, initial_value)
    end
    initial_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    if block_given?
      each(&block)
    else
      self
    end
  end
end
