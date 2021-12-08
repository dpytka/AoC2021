# frozen_string_literal: true

def path(x1, y1, x2, y2)
  if x1 == x2
    a = [y1, y2].sort
    (a[0]..a[1]).each { |el| yield(x1, el) }
    return
  end

  if y1 == y2
    a = [x1, x2].sort
    (a[0]..a[1]).each { |el| yield(el, y1) }
  end
end

arr = File.readlines('input.txt', chomp: true)
          .map { |el| el.split(' -> ').map { |el| el.split(',').map(&:to_i) } }

p arr
result_hash = {}

arr.each do |el|
  path(*el[0], *el[1]) do |x, y|
    key = "#{x}_#{y}"
    result_hash[key] = 0 unless result_hash.key?(key)
    result_hash[key] += 1
  end
end

p result_hash.values.filter { |el| el > 1 }.count
