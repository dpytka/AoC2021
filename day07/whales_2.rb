# frozen_string_literal: true

pos = File.open('input.txt').read.split(',').map(&:to_i)

min_val = 10_000_000_000
(pos.min..pos.max).each do |val|
  new_min = pos.sum do |el|
    ((el - val).abs + 1).times.sum
  end
  min_val = new_min if min_val > new_min
end

p min_val
