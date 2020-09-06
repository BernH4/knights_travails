# frozen_string_literal: true

require_relative 'path_node.rb'
require_relative 'knight.rb'
require 'pry'
require 'ap'

class GetPath
  include Movements
  def initialize
    @path_tree = nil
    @visited = []
    @start = nil
    @target = nil
    @start_node = nil
    @target_node = nil
  end

  def knight_moves(start, target)
    if valid?(start, target)
      @start = start
      @target = target
    else
      puts 'Invalid coordinates!'
      return
    end
    @start_node = PathNode.new(@start) # , 'head')
    @path_tree = build_tree(@start_node, target)
    # p backtrace_target
    p search_level_order
  end

  def valid?(start, target)
    start.length == 2 && target.length == 2 &&
      start[0].between?(0, 7) && start[1].between?(0, 7) &&
      target[0].between?(0, 7) && target[1].between?(0, 7)
  end

  def build_tree(node, target)
    if node.coords == target
      @target_node = node
      return
    elsif @visited.include?(node.coords)
      return
    end

    @visited << node.coords
    get_next_movements(node, target)
    node.get_next_nodes.each { |new_node| build_tree(new_node, target) }
  end

  def get_next_movements(node, _target)
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
    return path if node == @start

    path << node.coords
    backtrace_target(node.backtrace, path)
  end

  def search_level_order
    queue = [@start_node]
    path = []
    until queue.empty? || queue.first.coords == @target_node.coords
      binding.pry
      node = queue.shift
      node.instance_variables.each do |attribute|
        next if attribute == :@coords

        next_node = node.instance_variable_get(attribute)
        queue << next_node unless next_node.nil?
      end
      path << node.coords
    end
    path << @target_node.coords
  end
end

x = GetPath.new
x.knight_moves([0, 0], [3,3])
# y = PathNode.new([0,0])
# x.get_next_movements(y)
# binding.pry
# pp y
