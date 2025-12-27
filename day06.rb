f = File.read("input06.txt")
cells = f.split("\n").map(&:split).transpose

total = 0

cells.each do |row|
  *rest, op = row
  case op
  when "*"
    agg = 1

    rest.each { |elt| agg *= elt.to_i }

    total += agg
  when "+"
    agg = 0

    rest.each { |elt| agg += elt.to_i }

    total += agg
  end
end

puts total
f = File.read("input06.txt")
cells = f.split("\n").map(&:split)
widest_per_column = []

(0...cells[0].length).each do |col_idx|
  maximum = -1

  (0...cells.length).each do |row_idx|
    maximum = [cells[row_idx][col_idx].length, maximum].max
  end

  widest_per_column << maximum
end

unsplit_rows = f.split("\n")

so_far = 0

new_total = 0
widest_per_column.each_with_index do |width, i|
  num_strs = []

  (0...(unsplit_rows.length - 1)).each do |j|
    num_strs << unsplit_rows[j][so_far...(so_far + width)]
  end

  splitted =
    num_strs.map { |s| s.split("") }.transpose.map { |arr| arr.join("").to_i }

  op = unsplit_rows[-1].split[i].strip

  case op
  when "*"
    agg = 1

    splitted.each { |elt| agg *= elt.to_i }

    new_total += agg
  when "+"
    agg = 0

    splitted.each { |elt| agg += elt.to_i }

    new_total += agg
  end

  so_far += width + 1
end

puts new_total
