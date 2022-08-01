# frozen_string_literal: true

require './lib/linked_list'

def run_tests
  list = LinkedList.new

  list.append('data1')
  list.pop
  puts list.to_s
  list.append('data2')
  list.append('data3')
  puts "Current head: #{list.head}     Current tail: #{list.tail}"
  puts "Current size: #{list.size}"
  list.append('data4')
  puts "Current head: #{list.head}     Current tail: #{list.tail}"
  list.prepend('data5')
  puts "Current head: #{list.head}     Current tail: #{list.tail}"
  puts "Current size: #{list.size}"
  puts list.at(4)
  puts list.at(6)
  puts list.contains?('data3')
  puts list.contains?('hello')
  puts list.find('data2')
  puts list.find('world')
  list.pop
  puts "Current head: #{list.head}     Current tail: #{list.tail}"
  puts "Current size: #{list.size}"
  puts list.to_s
  list.append('data6')
  puts list.to_s
end

run_tests
