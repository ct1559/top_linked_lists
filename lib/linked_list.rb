# frozen_string_literal: true

require './lib/node'

# This class includes methods for modifying a linked list
class LinkedList

  def initialize
    @head = nil
    @tail = nil
    @current_node = nil
  end

  def append(value)
    create_node(value)
    @tail.next_node = @current_node if @current_node != @tail
    @tail = @current_node
  end

  def prepend(value)
    create_node(value)
    @current_node.next_node = @head
    @head = @current_node
  end

  def size(current_node = @head, count = 1)
    if current_node.next_node.nil?
      return count
    end

    size(current_node.next_node, count + 1)
  end

  def head
    @head.value
  end

  def tail
    return 'no tail' if @tail.nil?

    @tail.value
  end

  def at(index, current_node = @head, count = 1)
    if index == count
      current_node.value
    elsif current_node.next_node.nil?
      "Index: #{index} is out range. List range is: 1 - #{count + 1}"
    else
      at(index, current_node.next_node, count + 1)
    end
  end

  def pop(current_node = @head)
    if size == 1
      @head = nil
      @tail = nil
    elsif current_node.next_node == @tail
      current_node.next_node = nil
      @tail = current_node
    else
      pop(current_node.next_node)
    end
  end

  def contains?(value, current_node = @head)
    return true if current_node.value == value
    return false if current_node.next_node.nil?

    contains?(value, current_node.next_node)
  end

  def find(value, current_node = @head, count = 1)
    if value == current_node.value
      count
    elsif current_node.next_node.nil?
      "Value: '#{value}' is not in the linked list."
    else
      find(value, current_node.next_node, count + 1)
    end
  end

  def to_s(current_node = @head, list_string = '')
    return 'nil' if @head.nil?
    return "#{list_string}#{current_node.value} -> nil" if current_node.next_node.nil?

    to_s(current_node.next_node, list_string += "#{current_node.value} -> ")
  end

  def create_node(value)
    @current_node = Node.new(value)
    @head = @current_node if @head.nil?
    @tail = @current_node if @tail.nil?
  end
end
