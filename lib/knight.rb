# frozen_string_literal: true

module Movements
  def inside_board?(coords)
    coords[0].between?(0, 7) && coords[1].between?(0, 7)
  end

  def move(node, forward, side)
    coords = node.coords
    new_coords = [nil, nil]
    case forward
    when 'up'    then new_coords[1] = coords[1] + 2
    when 'right' then new_coords[0] = coords[0] + 2
    when 'down'  then new_coords[1] = coords[1] - 2
    when 'left'  then new_coords[0] = coords[0] - 2
    else
      puts 'Invalid step forward'
      return
    end

    case side
    when 'up'    then new_coords[1] = coords[1] + 1
    when 'right' then new_coords[0] = coords[0] + 1
    when 'down'  then new_coords[1] = coords[1] - 1
    when 'left'  then new_coords[0] = coords[0] - 1
    else
      puts 'Invalid step to side'
      return
    end
    inside_board?(new_coords) ? PathNode.new(new_coords, node) : nil
  end
end
