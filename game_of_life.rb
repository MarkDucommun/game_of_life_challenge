require 'pry'

class World
  attr_reader :size, :cells

  def initialize(size)
    @size = size
    @cells = Array.new(size) { Array.new(size, false) }
  end

  def set_alive(x, y)
    cells[x][y] = true
  end

  def alive_next_turn?(x, y)
    neighbors = get_neighbors(x, y)
    living_neighbors = neighbors.count(true)

    cell_lives?(cells[x][y], living_neighbors)
  end

  def get_neighbors(x, y)
    [
      {x: -1, y: -1},
      {x: -1, y: 0},
      {x: -1, y: 1},
      {x: 0, y:-1},
      {x: 0, y: 1},
      {x: 1, y: -1},
      {x: 1, y: 0},
      {x: 1, y: 1}
    ].map do |manipulations|
      x_coord = x + manipulations[:x]
      y_coord = y + manipulations[:y]
      cells[x_coord][y_coord]
    end
  end

  def cell_lives?(cell, living_neighbors)
    if living_neighbors < 2 || living_neighbors > 3
      return false
    elsif living_neighbors == 3
      return true
    else
      return cell
    end
  end
end

class Cell
  attr_accessor :live

  def initialize
    @live = false
  end

end
