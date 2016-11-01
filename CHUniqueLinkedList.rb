#!/usr/bin/ruby

require_relative './CHNode'
require 'set'

class CHUniqueLinkedList
  def initialize()
    @head = nil
    @set = Set.new()
  end

  def add(value)
    if value == nil
      return
    end

    if @head == nil
      @head = CHNode.new(value, nil)
      @set.add(value)
      return
    end

    if @set.include?(value)
      return
    else
      @set.add(value)
      curr = @head
      while curr.get_next() != nil
        curr = curr.get_next()
      end
      curr.set_next(CHNode.new(value, nil))
    end
  end

  def remove(value)
    if @head == nil
      return
    elsif @head.get_data() == value
      @head = @head.get_next()
      return
    end

    curr = @head
    while curr.get_next() != nil
      if curr.get_next().get_data() == value
        curr.set_next = curr.get_next().get_next()
        @set.remove(value)
      end
      curr = curr.get_next()
    end
  end

  def print()
    curr = @head
    while curr != nil
      puts curr.get_data()
      curr = curr.get_next()
    end
    puts "-"
  end
end


# Simple tests

list = CHUniqueLinkedList.new
puts "-- New Unique Linked List Created (no duplicates) --"

puts "Adding 1, 1, 2, 3, 3"
list.add(1)
list.add(1)
list.add(2)
list.add(3)
list.add(3)
list.print()

puts "After removing 1"
list.remove(1)
list.print()

list.remove(2)
puts "After removing 2"
list.print()

list.remove(2)
puts "Try to remove 2 again"
list.print()

list.remove(3)
list.remove(10)
puts "No items should be left"
list.print()
