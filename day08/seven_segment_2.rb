# frozen_string_literal: true

arr = File.readlines('input.txt', chomp: true)
          .map do |el|
  [
    el.split('|')[0].split.map { |el| el.chars.sort },
    el.split('|')[1].split.map { |el| el.chars.sort }
  ]
end

p arr.map do |line|
  decoder = Array.new(10)

  decoder[1] = line[0].select { |el| el.size == 2 }[0]
  decoder[4] = line[0].select { |el| el.size == 4 }[0]
  decoder[7] = line[0].select { |el| el.size == 3 }[0]
  decoder[8] = line[0].select { |el| el.size == 7 }[0]
  decoder[6] = line[0].select do |el|
    el.size == 6 and (el & decoder[1]).size == 1
  end[0]
  decoder[9] = line[0].select do |el|
    el.size == 6 and (el & decoder[4]).size == 4
  end[0]
  decoder[0] = line[0].select do |el|
    el.size == 6 and (el & decoder[4]).size != 4 and (el & decoder[1]).size != 1
  end[0]
  decoder[3] = line[0].select do |el|
    el.size == 5 and (el & decoder[1]).size == 2
  end[0]
  decoder[2] = line[0].select do |el|
    el.size == 5 and (el & decoder[6] & decoder[9]).size == 3
  end[0]
  decoder[5] = line[0].select do |el|
    el.size == 5 and (el & decoder[6] & decoder[9]).size == 5
  end[0]

  res = line[1].map do |el|
    decoder.index(el)
  end

  res.join.to_i
end.sum
