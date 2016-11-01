#!/usr/bin/ruby

class CHNode
  def initialize(data, next_node)
    @data = data
    @next = next_node
  end

  def get_data()
    return @data
  end

  def set_data(data)
    @data = data
  end

  def get_next()
    return @next
  end

  def set_next(node)
    @next = node
  end
end
