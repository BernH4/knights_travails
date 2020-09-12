# frozen_string_literal: true

require_relative 'path_node.rb'
require_relative 'knight.rb'
require 'pry'

class GetPath
  include Movements
  def initialize
    @path_tree = nil
    @visited = []
    @start = nil
    @target = nil
    @start_node = nil
    @target_node = nil
    @test_counter = 0
  end

  def knight_moves(start, target)
    if valid?(start, target)
      @start = start
      @target = target
    else
      puts 'Invalid coordinates!'
      return
    end
    @start_node = PathNode.new(@start, 'head')
    build_tree
    p backtrace_target
  end

  def valid?(start, target)
    start.length == 2 && target.length == 2 &&
      start[0].between?(0, 7) && start[1].between?(0, 7) &&
      target[0].between?(0, 7) && target[1].between?(0, 7)
  end

  def build_tree
    queue = [@start_node]
    until queue.empty?
      node = queue.shift
      # puts "Queuesize: #{queue.size}"
      break if node.coords == @target
      next if @visited.include?(node.coords)
      @visited << node.coords
      @test_counter += 1
      puts @test_counter if @test_counter % 10 == 0
      get_next_movements(node)
      node.instance_variables.each do |attr|
        cur_node = node.instance_variable_get(attr)
        next if attr == :@coords || attr == :@backtrace

        queue << cur_node unless cur_node.nil?
      end
    end
    @target_node = node
  end

  def get_next_movements(node)
    node.upleft = move(node, 'up', 'left')
    node.upright = move(node, 'up', 'right')
    node.rightup = move(node, 'right', 'up')
    node.rightdown = move(node, 'right', 'down')
    node.downleft = move(node, 'down', 'left')
    node.downright = move(node, 'down', 'right')
    node.leftdown = move(node, 'left', 'down')
    node.leftup = move(node, 'left', 'up')
  end

  def backtrace_target(node = @target_node, path = [])
    return path if node == 'head'

    path << node.coords
    backtrace_target(node.backtrace, path)
  end

 end

x = GetPath.new
x.knight_moves([3, 3], [7, 7])
# y = PathNode.new([0,0])
# x.get_next_movements(y)
# binding.pry
# pp y
