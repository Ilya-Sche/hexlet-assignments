# frozen_string_literal: true
require 'minitest/autorun'
require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
    def setup
     @stack = Stack.new
    end
    def test_push_element
      @stack.push!(5) 
      assert_equal [5], @stack.elements
    end
     def test_pop_element
      @stack.push!(1) 
      @stack.push!(2)
      @stack.push!(3)
      @stack.pop!
      assert_equal [1, 2], @stack.elements
     end
    def test_element_delete
      @stack.push!(1)
      @stack.clear!
      assert_equal [], @stack.elements
    end
     def test_element_empty?
      @stack.push!(1)
      @stack.empty?
      assert_equal [1], @stack.elements
    end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
