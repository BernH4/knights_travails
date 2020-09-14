# frozen_string_literal: true

class PathNode
  attr_accessor :coords, :backtrace, :upleft, :upright, :rightup, :rightdown, :downleft, :downright, :leftdown, :leftup
  def initialize(coords, backtrace)
    # puts backtrace
    @coords = coords
    @backtrace = backtrace
    @upleft = nil
    @upright = nil
    @rightup = nil
    @rightdown = nil
    @downleft = nil
    @downright = nil
    @leftdown = nil
    @leftup = nil
  end

  # def get_next_nodes
  #  #Returns an array with nodes of all possible next coordinates
  #  instance_variables.reduce([]) do |arr, attribute|
  #    next arr if attribute == :@coords || attribute == :@backtrace
  #    next_node = instance_variable_get(attribute)
  #    next_node.nil? ? arr : arr << PathNode.new(next_node.coords)#, self)
  #  end
  # end

  def to_s
    "Own Coords: #{@coords}"
  end
end
