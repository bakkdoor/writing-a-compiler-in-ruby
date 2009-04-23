# Array class implementation.
class Array
  def initialize(*initial_elements)
    # add some code to allocate memory
    # and add the given elements to the created array.

    %s(do
         (assign array
          # create array of initial_elements.length size elements
          (array (callm initial_elements length)))
         # add elements to array here...
         )
  end

  def [](idx)
    # return element at index #idx
    %s(index self idx)
  end

  def []=(idx, value)
    %s(assign (index self idx) value)
  end

  # some more stuff here...
end
