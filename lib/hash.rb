# Represents an entry in a hash.
class HashEntry
  attr_accessor :key, :value

  def initialize(key, value)
    @key = key
    @value = value
  end
end

# Hash class.
# Contains key-value pairs (using HashEntry instances).
class Hash
  attr_accessor :entries

  # Hash-Constructor.
  # Takes a array of keys and values intermixed.
  #
  # Usage:
  # h = Hash.new(key1, value1, key2, value2)
  def initialize(*key_value_pair_array)
    # empty entries array
    @entries = Array.new

    # we need an even amount of keys & values to work correctly
    if(key_value_pair_array.length.mod(2) != 0)
      key_value_pair_array.in_groups_of(2) do |key, value|
        @entries.add(HashEntry.new(key, value))
      end
    else
      raise "HashError: Amount of keys and values not matching!"
    end
  end

  def [](key)
    get_value(key)
  end

  def []=(key, value)
    set_value(key, value)
  end

  def has_key?(key)
    @entries.each do |entry|
      if entry.key == key
        return true
      end
    end

    return false
  end

  def each_key
    @entries.each do |pair|
      yield(pair.key)
    end
  end

  def each(&block)
    # same as each_pair
    each_pair(&block)
  end

  def each_pair
    @entries.each do |pair|
      yield(pair.key, pair.value)
    end
  end

  # protected not supported yet.
  # will be added later:

  # protected

  def get_entry(key)
    @entries.each do |item|
      if item.key == key
        return item.value
      end
    end

    # no entry found => return new entry & add to entries list.
    new_entry = HashEntry.new(key, nil)
    @entries << new_entry
    return new_entry
  end

  def get_value(key)
    get_entry(key).value
  end

  def set_value(key, value)
    get_entry(key).value = value
  end
end
