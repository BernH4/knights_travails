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

  def move(forward, side)
    new_coords = [nil,nil]
    case forward
    when "up"
      new_coords[1] = @coords[1] + 2
    when "right"
      new_coords[0] = @coords[0] + 2
    when "down"
      new_coords[1] = @coords[1] - 2
    when "left"
      new_coords[0] = @coords[0] - 2
    else
      puts 'Invalid side'
    end

    case side
    when "up"
      new_coords[1] = @coords[1] + 1
    when "right"
      new_coords[0] = @coords[0] + 1
    when "down"
      new_coords[1] = @coords[1] - 1
    when "left"
      new_coords[0] = @coords[0] - 1
    else
      puts 'Invalid side'
    end
    @coords = new_coords if inside_board?(new_coords) 
  end

knight = Knight.new [4,4]
p knight.coords
knight.move("up","left")
p knight.coords
knight.coords = [4,4]
knight.move("up","right")
p knight.coords
knight.coords = [4,4]
knight.move("right","up")
p knight.coords
knight.coords = [4,4]
knight.move("right","down")
p knight.coords
knight.coords = [4,4]
knight.move("down","right")
p knight.coords
knight.coords = [4,4]
knight.move("down","left")
p knight.coords
knight.coords = [4,4]
knight.move("left","down")
p knight.coords
knight.coords = [4,4]
knight.move("left","up")
p knight.coords
