f = File.read("input04.txt")

grid = f.strip.split.map(&:chars)

# puts grid.inspect

directions = [
  [-1, 0],
  [-1, 1],
  [-1, -1],
  [0, -1],
  [0, 1],
  [1, -1],
  [1, 0],
  [1, 1]
]

total = 0

(0...grid.length).each do |i|
  (0...grid[0].length).each do |j|
    next if grid[i][j] != "@"
    num_around = 0

    directions.each do |dx, dy|
      x, y = i + dx, j + dy

      next if x < 0 || x >= grid.length || y < 0 || y >= grid[0].length

      num_around += 1 if grid[x][y] == "@"
    end

    total += 1 if num_around < 4
  end
end

puts total

def one_loop(grid, directions)
  locs = []
  (0...grid.length).each do |i|
    (0...grid[0].length).each do |j|
      next if grid[i][j] != "@"
      num_around = 0

      directions.each do |dx, dy|
        x, y = i + dx, j + dy

        next if x < 0 || x >= grid.length || y < 0 || y >= grid[0].length

        num_around += 1 if grid[x][y] == "@"
      end

      locs << [i, j] if num_around < 4
    end
  end

  locs.each { |x, y| grid[x][y] = "." }

  return locs.length
end

removed = 0

loop do
  num_new_removed = one_loop(grid, directions)

  removed += num_new_removed

  break if num_new_removed == 0
end

puts removed
