# frozen_string_literal: true

def lowest?(heightmap, x, y)
  adjacent = []
  adjacent << heightmap[x - 1][y] if x.positive?
  adjacent << heightmap[x][y - 1] if y.positive?

  adjacent << heightmap[x + 1][y] if x < heightmap.size - 1
  adjacent << heightmap[x][y + 1] if y < heightmap[0].size - 1

  adjacent.min > heightmap[x][y]
end

heightmap = File.readlines('input.txt', chomp: true).map { |el| el.chars.map(&:to_i) }

lowest = []
heightmap.each_index do |x|
  heightmap[x].each_index do |y|
    lowest << heightmap[x][y] if lowest?(heightmap, x, y)
  end
end

p lowest.size + lowest.sum
