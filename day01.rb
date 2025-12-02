s = File.read("input01.txt")

rows = s.split.map(&:strip)

dial = 50

score = 0

rows.each do |row|
  num = row[1...].to_i
  if row[0] == "R"
    dial += num
  else
    dial -= num
  end

  dial %= 100

  score += 1 if dial == 0
end

puts score

dial = 50
clicks = 0

rows.each do |row|
  num = row[1...].to_i

  if row[0] == "R"
    num.times do
      dial += 1
      dial %= 100

      clicks += 1 if dial == 0
    end
  else
    num.times do
      dial -= 1
      dial %= 100

      clicks += 1 if dial == 0
    end
  end

  dial %= 100
end

puts clicks
