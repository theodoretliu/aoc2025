f = File.read("input03.txt")

lines = f.strip.split.map(&:chars)

s = 0

def process_line(line)
  max = 0

  (0...(line.length - 1)).each do |i|
    ((i + 1)...(line.length)).each do |j|
      num = (line[i] + line[j]).to_i

      max = num if num > max
    end
  end

  return max
end

def process_line_2(line)
  cache = {}

  def tmp(starting_index, remaining, cache, line)
    return "" if remaining == 0

    if !cache[[starting_index, remaining]].nil?
      return cache[[starting_index, remaining]]
    end

    if starting_index == line.length - remaining
      return line[starting_index...line.length].join
    end

    return "" if starting_index > line.length - remaining

    tail = tmp(starting_index + 1, remaining - 1, cache, line)

    one_res = (line[starting_index] + tail).to_i
    other_res = tmp(starting_index + 1, remaining, cache, line)

    res = [one_res, other_res.to_i].max.to_s

    cache[[starting_index, remaining]] = res

    return res
  end

  return tmp(0, 12, cache, line)
end

lines.each { |line| s += process_line(line) }

puts s

s = 0

lines.each { |line| s += process_line_2(line).to_i }

puts s
