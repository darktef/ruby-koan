require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutArrays < Neo::Koan
  def test_creating_arrays
    empty_array = Array.new
    assert_equal Array, empty_array.class
    assert_equal 0, empty_array.size
  end

  def test_array_literals
    array = Array.new
    assert_equal [], array

    array[0] = 1
    assert_equal [1], array

    array[1] = 2
    assert_equal [1, 2], array

    array << 333
    assert_equal [1, 2, 333], array
  end

  def test_accessing_array_elements
    array = [:peanut, :butter, :and, :jelly]

    assert_equal :peanut, array[0]
    assert_equal :peanut, array.first
    assert_equal :jelly, array[3]
    assert_equal :jelly, array.last
    assert_equal :jelly, array[-1]
    assert_equal :butter, array[-3]
  end

  def test_slicing_arrays
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut], array[0,1]
    assert_equal [:peanut, :butter], array[0,2]
    assert_equal [:and, :jelly], array[2,2]
    assert_equal [:and, :jelly], array[2,20]
    assert_equal [], array[4,0]
    assert_equal [], array[4,100]
    assert_equal nil, array[5,0]

    # Observation:
    # special case related to the lenght of array
    # in general, when an index is not found, it returns nil
    # but if the index is equal to the length of array, it will return empty array
    # Explanation found online:
    # 1. https://www.ruby-forum.com/topic/1393096#990065
    # 2. http://stackoverflow.com/questions/3568222/array-slicing-in-ruby-looking-for-explanation-for-illogical-behaviour-taken-fr
    # The second source gives a pretty simple and straightford explanation
    #   :peanut   :butter   :and   :jelly
    # 0         1         2      3        4
    # Different Operations: SLICE VS INDEX, which are referring to different elements in the array

  end

  def test_arrays_and_ranges
    assert_equal Range, (1..5).class
    assert_not_equal [1,2,3,4,5], (1..5)
    assert_equal [1, 2, 3, 4, 5], (1..5).to_a
    assert_equal [1,2,3,4], (1...5).to_a

    # Range could not go backwards when transferring to array, such as (-1..-5) or (5..1)
    # these will only result in empty array
  end

  def test_slicing_with_ranges
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut, :butter, :and], array[0..2]
    assert_equal [:peanut, :butter], array[0...2]
    assert_equal [:and, :jelly], array[2..-1]
  end

  def test_pushing_and_popping_arrays
    array = [1,2]
    array.push(:last)

    assert_equal [1,2,:last], array

    popped_value = array.pop
    assert_equal :last, popped_value
    assert_equal [1,2], array
    # The method pop removes the last element in an array and returns it
  end

  def test_shifting_arrays
    array = [1,2]
    array.unshift(:first)

    assert_equal [:first,1,2], array

    shifted_value = array.shift
    assert_equal :first, shifted_value
    assert_equal [1,2], array
    # Removes the first element of self and returns it (shifting all other elements down by one). 
    # Returns nil if the array is empty.
  end

end
