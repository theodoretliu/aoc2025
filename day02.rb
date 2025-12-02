ranges =
  File
    .read("input02.txt")
    .split(",")
    .map do |s|
      l, r = s.split("-")
      [l.to_i, r.to_i]
    end

def is_invalid(i)
  x = i.to_s

  (1...(x.length / 2 + 1)).each do |y|
    next if x.length % y != 0

    return true if x[0...y] * (x.length / y) == x
  end

  return false
end

final = 0
ranges.each do |l, r|
  (l...(r + 1)).each do |i|
    x = i.to_s

    if x.length % 2 == 0
      final += i if x[0...(x.length / 2)] == x[(x.length / 2)...]
    end
  end
end

puts final

final = 0
ranges.each { |l, r| (l...(r + 1)).each { |i| final += i if is_invalid(i) } }

puts final
