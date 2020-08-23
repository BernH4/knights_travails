# frozen_string_literal: true

require 'pry'

class Knight
  attr_accessor :coords
  def initialize(coords = [0, 0])
    @coords = coords
  end
  
  def inside_board?(coords)
    coords[0].between?(0, 7) && coords[1].between?(0, 7)
  end

  def move_up_left
    new_coords = [@coords[0] - 1, @coords[1] + 2]
    @coords = new_coords if inside_board?(new_coords) 
  end

  def move_up_right
    new_coords = [@coords[0] + 1, @coords[1] + 2]
    @coords = new_coords if inside_board?(new_coords) 
  end

  def move_right_up
    new_coords = [@coords[0] + 2, @coords[1] + 1]
    @coords = new_coords if inside_board?(new_coords) 
  end

  def move_right_down
    new_coords = [@coords[0] + 2, @coords[1] - 1]
    @coords = new_coords if inside_board?(new_coords) 
  end

  def move_down_right
    new_coords = [@coords[0] + 1, @coords[1] - 2]
    @coords = new_coords if inside_board?(new_coords) 
  end

  def move_down_left
    new_coords = [@coords[0] - 1, @coords[1] - 2]
    @coords = new_coords if inside_board?(new_coords) 
  end

  def move_left_down
    new_coords = [@coords[0] - 2, @coords[1] - 1]
    @coords = new_coords if inside_board?(new_coords) 
  end

  def move_left_up
    new_coords = [@coords[0] - 2, @coords[1] + 1]
    @coords = new_coords if inside_board?(new_coords) 
  end
end

knight = Knight.new [4,4]
p knight.coords
knight.move_up_left
p knight.coords
knight.coords = [4,4]
knight.move_up_right
p knight.coords
knight.coords = [4,4]
knight.move_right_up
p knight.coords
knight.coords = [4,4]
knight.move_right_down
p knight.coords
knight.coords = [4,4]
knight.move_down_right
p knight.coords
knight.coords = [4,4]
knight.move_down_left
p knight.coords
knight.coords = [4,4]
knight.move_left_down
p knight.coords
knight.coords = [4,4]
knight.move_left_up
p knight.coords
