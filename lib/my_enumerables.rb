# Enumerable module
module Enumerable
  # Define <<my_each_with_index>> here
  def my_each_with_index
    return unless block_given?

    i = 0
    while i < self.length
      yield(self[i], i)
      i += 1
    end
    self
  end

  # Define <<my_select>> here
  def my_select
    return unless block_given?

    i = 0
    selected = []
    while i < self.length
      selected.push(self[i]) if yield(self[i])
      i += 1
    end
    selected
  end

  # Define <<my_all>> here
  def my_all?
    return unless block_given?

    i = 0
    while i < self.length
      return false unless yield(self[i])

      i += 1
    end
    true
  end

  # Define <my_any>> here
  def my_any?
    return unless block_given?

    i = 0
    while i < self.length
      return true if yield(self[i])

      i += 1
    end
    false
  end

  # Define <my_none>> here
  def my_none?
    return unless block_given?

    i = 0
    while i < self.length
      return false if yield(self[i])

      i += 1
    end
    true
  end

  # Define <my_count>> here
  def my_count
    return self.length unless block_given?

    i = 0
    c = 0
    while i < self.length
      c += 1 if yield(self[i])

      i += 1
    end
    c
  end

  # Define <my_map>> here
  def my_map
    return self.length unless block_given?

    i = 0
    mapped_array = []
    while i < self.length
      mapped_array.push(yield(self[i]))
      i += 1
    end
    mapped_array
  end

  # Define <my_inject>> here
  def my_inject(initial)
    return self.length unless block_given?

    i = 0
    reduced = initial || 0

    while i < self.length
      reduced = yield(reduced, self[i])
      i += 1
    end
    reduced
  end
end

# Array class
class Array
  # Define <<my_each>> here
  def my_each
    return unless block_given?

    i = 0

    while i < self.length
      yield self[i]
      i += 1
    end
    ## Apparently, Ruby returns self if you do not explicitly return anything in an object. Here, I just typed
    ## <<self>> to feel like I am in control.
    self
  end
end

my_array = [1, 1, 2, 3, 5, 8, 13, 21, 34]

initial_value = 0
my_array.my_inject(1) { |prod, value| prod * value }
