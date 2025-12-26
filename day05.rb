f = File.read("input05.txt")

ranges = []
things = []

mode = "ranges"
total = 0

f
  .split("\n")
  .each do |line|
    puts line.inspect

    if line == ""
      mode = "things"
      next
    end

    case mode
    when "ranges"
      l, r = line.split("-").map { |x| x.to_i }

      puts l.inspect, r.inspect

      ranges << [l, r]
    when "things"
      things << line.to_i
    end
  end

# puts ranges.inspect

things.each do |thing|
  ranges.each do |l, r|
    if l <= thing && thing <= r
      total += 1
      break
    end
  end
end

print(total)

sorted_ranges = ranges.sort

puts sorted_ranges.inspect

cur_range = nil

new_total = 0

sorted_ranges.each do |range|
  puts range.inspect
  puts cur_range.inspect
  if cur_range == nil
    cur_range = range
    next
  end

  if cur_range[0] == range[0]
    cur_range = range
    next
  end

  if cur_range[0] < range[0]
    if cur_range[1] < range[0]
      new_total += cur_range[1] - cur_range[0] + 1
      cur_range = range
    else
      cur_range[1] = [range[1], cur_range[1]].max
    end
  end
end

new_total += cur_range[1] - cur_range[0] + 1

puts new_total
